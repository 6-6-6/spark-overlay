assign() {
	echo ${1}/handmade
	touch ${1}/handmade
}

assign_baddep() {
	echo ${1}/handmade.bsaddep
	touch ${1}/handmade.baddep
}

for i in $(ls);do
	case ${i} in
		netty*) ;&
		mahout-math) ;&
		reactor-core) ;&
		weld-core) ;&
		jersey*) ;&
		jetty*) ;&
		xml-apis) ;&
		jetty-sslengine) ;&
		maven-ant-tasks) ;&
		xbean-asm7-shaded)
			assign ${i} ;;
		htrace-core) ;&
		xml-resolver) ;&
		osgi-cmpn) ;&
		jackson-mapper-asl) ;&
		jets3t) ;&
		apache-rat-tasks) ;&
		zookeeper) ;&
		jackson-jaxrs) ;&
		avro) ;&
		hibernate-commons-annotations) ;&
		javax-persistence) ;&
		woodstox-core-asl) ;&
		tomcat-embed-core)
			assign_baddep ${i} ;;
	esac
done
