FROM  amazoncorretto:17.0.7

COPY target/Backoffice.jar /usr/src
WORKDIR /usr/src
CMD java -Xms128M -Xmx128M -Xss1024k -XX:ReservedCodeCacheSize=32M -XX:CodeCacheExpansionSize=512k -XX:MaxDirectMemorySize=64M -XX:CompressedClassSpaceSize=32M -XX:MaxMetaspaceSize=64M -XX:+PerfDisableSharedMem -jar Backoffice.jar
EXPOSE 8080