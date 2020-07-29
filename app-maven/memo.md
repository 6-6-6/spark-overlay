weird poms:

# immediately recompile
hibernate-core
hibernate-entitymanager: empty package
json4s-ast: empty package
hibernate-validator
hadoop-mapreduce-client-app
hadoop-client: empty package

# test scope dependencies turn out to be common ones
- [] stream: colt

# patched
- [] mahout-math: to support newer guava
- [] reactor-core: backport concurrent
- [] netty-4: SLOTTING!!!!!!!!!!!!

# RSOURCES!!
- [] weld-core: resources needed !!

## NEED sLOTTING
- [] jersey*: ********** com.sun and org.glassfish
- [] jetty
- [] netty
- [] npn-api: 1.1.x and 8.1.x ???

# strange source-files
- [] maven-*
- [] jruby-core
- [] jdeb: totally not compatable with bcpg??
- [] jruby: a virtual package
- [] maven-ant-tasks: cannot find symbol
- [] ant-launcher: weird SRC_DIR

# wrong jdk version
- [] xml-api: jdk-1.4
- [] jetty-sslengine: should be greater than 1.4 while 1.4 is set
- [] maven-ant-tasks: should be greater than 1.4 and less than 1.6 while 1.4 is set
- [] xbean-asm7-shaded: greater than 1.5 (diamod operator), while 1.5 is set

# missing dependencies
- [] htrace-core-3.10-incubating
- [] xml-resolver
- [] osgi-cmpn:6 (B.T.W SLOT changed by hand)
- [] jackson-mapper-asl
- [] jetty-*: (two versions SLOT changed)
- [] jets3t
- [] apache-rat-tasks: !!![not fixed]!!!
- [] osgi-cmpn: many javax
- [] zookeeper: jline
- [] jackson-jaxrs: jackson-xc
- [] avro: guava
- [] hibernate-commons-annotations: jboss-logging-anno*
- [] kryo-shaded: reflect-asm
- [] alpn-boot: alpn-api
- [] npn-boot: npn-api
- [] javax-persistence: osgi-framework
- [] woodstox-core-asl: osgi-framework, relaxng, msv
- [] tomcat-embed-core: javaxapis

# JAVA_TOOLS
- [] audience-annotations
- [] hadoop-annotations

# differ a lot from binjar
- [] clover

# module-info
- [] mailapi
- [] jakarta-activation-api
- [] jakarta-xml-bind-api (MERTA_INF also)

# handmade
- [] luc ene-queryparser:3.6 (needed by h2-*196)
- [] ju g (needed by jet  s3t)
- [] app-m aven/microemu-cldc (needed by osgi-cm pn)
- [] apa cheds-kerberos-codec
- [] je rsey-media-sse (needed by ehcac he)
- [] 2 verisons of gp ars, which solves circular deps
- [] java9-concur rent-backport: backport jdk9 feature

# unpack fail
- [] jruby-*
# binary installed
- [] h2
- [] curator-*: compile error
- [] ant-launcher: weird SRC_DIR, maven does not distribute source code
- [] jersey-guice: com sun vs org glass
- [] hadoop-yarn-common: above
- [] hadoop-mapreduce-client-core: compile error
- [] alpn-boot: compile error
- [] npn-boot: compile error
- [] caffeine: compile error
- [] jboss-interceptor-core: compile error
- [] woodstox-core-asl: compile error
- [] jackson-module-jaxb-annotations: compile error
- [] jackson-dataformat-xml: compile error
- [] freemarker: fucking stupid
- [] hazelcast: fucking stupid
- [] jetty-server: compile error
- [] hadoop-hdfs
- [] spark-network-common
- [] hadoop-yarn-server-nodemanager: compile error
- [] hadoop-mapreduce-client-shuffle: compile error
