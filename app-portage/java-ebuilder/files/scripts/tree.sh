#!/bin/bash
# start from the root of a maven artifact and recursively resolve its
# dependencies.

source $CONFIG

REPOSITORY="https://repo1.maven.org/maven2"

tsh_log() {
    [[ ! -z "TSH_DEBUG" ]] && echo [x] $*
}

# convert MavenVersion to PortageVersion
sver() {
    PV=$1
    # com.github.lindenb:jbwa:1.0.0_ppc64
    PV=${PV/_/.}
    # plexus-container-default 1.0-alpha-9-stable-1
    PV=${PV/-stable-/.}
    PV=$(sed -r 's/[.-]?alpha[-.]?/_alpha/' <<< ${PV})
    # wagon-provider-api 1.0-beta-7
    # com.google.cloud.datastore:datastore-v1beta3-proto-client:1.0.0-beta.2
    # com.google.cloud.datastore:datastore-v1beta3-protos:1.0.0-beta
    PV=$(sed -r 's/[.-]?beta[-.]?/_beta/' <<< ${PV})
    # aopalliance-repackaged 2.5.0-b16
    PV=${PV/-b/_beta}
    # com.google.auto.service:auto-service:1.0-rc2
    PV=${PV/-rc/_rc}
    # cdi-api 1.0-SP4
    PV=${PV/-SP/_p}
    # org.seqdoop:cofoja:1.1-r150
    PV=${PV/-rev/_p}
    PV=${PV/-r/_p}
    PV=${PV/.v/_p}
    # javax.xml.stream:stax-api:1.0-2
    PV=${PV//-/.}
    # .Final .GA -incubating means nothing
    PV=${PV%.[a-zA-Z]*}
    # com.google.cloud.genomics:google-genomics-dataflow:v1beta2-0.15 -> 1.2.0.15
    # plexus-container-default 1.0-alpha-9-stable-1 -> 1.0.9.1
    while [[ ${PV} != ${PV0} ]]; do
	PV0=${PV}
	PV=$(sed -r 's/_(rc|beta|alpha|p)(.*\..*)/.\2/' <<< ${PV0})
    done
    # remove all non-numeric charactors before _
    # org.scalamacros:quasiquotes_2.10:2.0.0-M8
    if [[ ${PV} = *_* ]]; then
	PV=$(sed 's/[^.0-9]//g' <<< ${PV/_*/})_${PV/*_/}
    else
	PV=$(sed 's/[^.0-9]//g' <<< ${PV})
    fi
    # if generate multiple dots, reduce them into single dot
    sed 's/\.\+/\./g' <<< ${PV}
}

# get an existing maven version
get_maven() {
    tsh_log get_maven: MV_RANGE = ${MV}, MID = ${PG}:${MA}
    local MV_RANGE=${MV} FOUND_JAR
    if [[ -z "${MAVEN_FORCE_VERSION}" ]]; then
        local nversions=$(xmllint --xpath "/metadata/versioning/versions/version/text()" "${ARTIFACT_METADATA}" | wc -l)
    else
        local nversions=1
    fi

    #for line_number in $(seq ${nversions} -1 1); do
    for line_number in $(seq ${nversions} -1 1); do
        if [[ -z "${MAVEN_FORCE_VERSION}" ]]; then
            MV=$(xmllint --xpath "/metadata/versioning/versions/version/text()" "${ARTIFACT_METADATA}" | awk "NR==${line_number}{print $1}")
	    TMP_SLOT=$(${COMPARE_MVN_VERSION} --dep "${MV_RANGE}" --maven-version ${MV}) || continue
	    eval $TMP_SLOT
	    [[ ! -z ${TMP_SLOT} ]] && tsh_log "Setting SLOT of $MA to $TMP_SLOT, because dependency ${MV_RANGE} incicates so..."
	fi
        #echo $MV
        #echo $POMDIR
        #echo $METADATA_URI
        #echo ================

        MID=${PG}:${MA}:${MV}
        PV=$(sver ${MV})
        M=${MA}-${MV}
        SRC_URI="${REPOSITORY}/${WORKDIR}/${MV}/${M}-sources.jar"
        POM_URI="${REPOSITORY}/${WORKDIR}/${MV}/${M}.pom"
        if ! wget -q --spider ${SRC_URI}; then
            TMP_SRC_URI=${SRC_URI/-sources.jar/.jar}
	    if wget -q --spider ${TMP_SRC_URI}; then
	        SRC_URI=${TMP_SRC_URI}
                PA=${PA}
                return 0
	    fi
	else
	    return 0
        fi
    done

    # if we cannot found a suitble version
    return 1
}


# generate ebuild file
gebd() {
    tsh_log "gebd: MID is $PG:$MA:$MV"
    local WORKDIR=${PG//./\/}/${MA} MID
    local CATEGORY PA SLOT

    # spark-launcher_2.11 for scala 2.11
    eval $(sed -nr 's,([^_]*)(_(.*))?,PA=\1 SLOT=\3,p' <<< ${MA})
    [[ -z "${SLOT}" ]] && eval $(sed -nr 's,(.*)-(([0-9]+\.)?[0-9]+),PA=\1 SLOT=\2,p' <<< ${MA})
    [[ -z "${SLOT}" ]] && PA=${MA}
    PA=${PA//./-}
    PA=${PA//_/-}
    [[ ! -z "${MAVEN_FORCE_PA}" ]] && PA=${MAVEN_FORCE_PA} && unset MAVEN_FORCE_PA
    [[ ! -z "${MAVEN_FORCE_SLOT}" ]] && SLOT=${MAVEN_FORCE_SLOT} && unset MAVEN_FORCE_SLOT

    CATEGORY=$(grep "${PG}:${MA}:" "${CACHEDIR}"/${CUR_STAGE}-cache | awk -F: 'NR==1{print $1}')
    #[[ -z "${CATEGORY}" ]] || PA=$(grep "${PG}:${MA}:" "${CACHEDIR}"/${CUR_STAGE}-cache | awk -F: 'NR==1{print $2}')
    [[ -z "${CATEGORY}" ]] && CATEGORY=app-maven

    tsh_log "gebd: CATEGORY is ${CATEGORY}, PA is ${PA}"

    local METADATA_URI="${REPOSITORY}/${WORKDIR}/maven-metadata.xml"
    local ARTIFACT_METADATA="${POMDIR}/metadata-${PG}-${MA}.xml"
    if [[ ! -f ${ARTIFACT_METADATA} ]]; then
        pushd "${POMDIR}" > /dev/null
        wget -O ${ARTIFACT_METADATA} ${METADATA_URI} -q || rm -f ${ARTIFACT_METADATA}
	popd
    fi

    local MID PV M SRC_URI POM_URI

    MAVEN_FORCE_VERSION=1 get_maven || get_maven

    if [[ ! -f "${POMDIR}"/${M}.pom ]]; then
        pushd "${POMDIR}" > /dev/null
        wget ${POM_URI}

        # 3rd party plugin not needed here
        # distributionManagement is invalid for maven 3
        # net.sf.jtidy:jtidy:r938 version is not maven-compliant
        sed -e '/<packaging>bundle/d' \
            -e '/<distributionManagement>/,/<\/distributionManagement>/d' \
            -e '/<build>/,/<\/build>/d' \
            -e '/<modules>/,/<\/modules>/d' \
            -e 's,<version>r938</version>,<version>1.0</version>,' \
            -i ${M}.pom
        popd
    fi

    local P=${PA}-${PV}
    local cur_stage_ebd="${CUR_STAGE_DIR}"/${CATEGORY}/${PA}/${P}.ebuild
    local final_stage_ebd="${MAVEN_OVERLAY_DIR}"/${CATEGORY}/${PA}/${P}.ebuild


    line=${CATEGORY}:${PA}:${PV}:${SLOT:-0}::${MID}
    if ! grep -q ${line} "${CACHEDIR}"/${CUR_STAGE}-maven-cache 2>/dev/null ; then
        pushd "${CACHEDIR}" > /dev/null
        echo ${line} >> ${CUR_STAGE}-maven-cache
        cat ${GENTOO_CACHE} ../cache.extra ${CUR_STAGE}-maven-cache > ${CUR_STAGE}-cache
        popd > /dev/null
    fi


    if [[ ! -f "${cur_stage_ebd}" ]]; then
        mkdir -p $(dirname ${cur_stage_ebd})
        tsh_log "java-ebuilder: generage ebuild files for ${MID} in ${CUR_STAGE}"
        java-ebuilder -p "${POMDIR}"/${M}.pom -e "${cur_stage_ebd}" -g --workdir "${POMDIR}" \
                      -u ${SRC_URI} --slot ${SLOT:-0} --keywords ~amd64 \
                      --cache-file "${CACHEDIR}"/${CUR_STAGE}-cache
	RET=$?
	[[ $RET -ne 0 ]] && echo "java-ebuilder RET: $RET" && exit 1
    fi

    # filling parent target_line
    [[ ! -z ${MAKEFILE_DEP} ]] && target_line+="${final_stage_ebd} "
    [[ -z ${MAKEFILE_DEP} ]] && local target_line+="all: ${final_stage_ebd}\n"
    # filling my target_line
    local target_line+="#${final_stage_ebd}"
    target_line+="\n"
    target_line+="${final_stage_ebd}: "
    
    [[ -z "${MAVEN_NODEP}" ]] && MAKEFILE_DEP=1 mfill "${cur_stage_ebd}"
    
    target_line+="\n"
    target_line+="\tmkdir -p $(dirname ${final_stage_ebd})"
    target_line+="\n"
    target_line+="\tjava-ebuilder -p \"${POMDIR}\"/${M}.pom -e \"${final_stage_ebd}\" -g --workdir \"${POMDIR}\""
    target_line+=" -u ${SRC_URI} --slot ${SLOT:-0} --keywords ~amd64"
    [[ ${SRC_URI} = *-sources.jar ]] && target_line+=" --from-maven-central --binjar-uri ${SRC_URI/-sources.jar/.jar}"
    target_line+=" --cache-file \"${CACHEDIR}\"/${CUR_STAGE}-cache"
    target_line+="\n"
    [[ ${SRC_URI} = *-sources.jar ]] || target_line+="\tsed -i \"/inherit/s/java-pkg-simple/java-pkg-binjar/\" \"${final_stage_ebd}\"\n"
    target_line+="\n"

    if ! grep -q "#${final_stage_ebd}" ${TARGET_MAKEFILE} 2>/dev/null ; then
        echo -e $target_line >> ${TARGET_MAKEFILE}
    fi
}

# filling dependencies
mfill() {
    # recursively fill missing dependencies
    arts=$(sed -n -r 's,# (test\? )?(.*) -> !!!.*-not-found!!!,\2,p' < $1)
    tsh_log "mfill: dealing with $1"
    if [[ -z "${arts}" ]]; then
        return # no need to java-ebuilder again
    else
        for a in ${arts}; do
            eval $(awk -F":" '{print "PG="$1, "MA="$2, "MV=""\x27"$3"\x27"}' <<< ${a})
            gebd
        done
        return
    fi
}

if [[ ! -z ${JUST_MFILL} ]]; then
    mfill $1
    exit $?
elif [[ $1 == *.ebuild ]]; then
    eval $(grep MAVEN_ID $1)
    eval $(grep MAVEN_FORCE_PA $1)
    eval $(grep MAVEN_FORCE_CATEGORY $1)
    #rm -f $1
else
    MAVEN_ID=$1
fi
eval $(awk -F":" '{print "PG="$1, "MA="$2, "MV="$3}' <<< ${MAVEN_ID})
gebd
tsh_log "Tree.sh: reaching the end of the script"
