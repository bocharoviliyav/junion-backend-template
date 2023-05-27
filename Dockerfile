FROM maven:3.9.2-amazoncorretto-17-debian as application
COPY ./ /tmp
RUN cd /tmp && \
    mvn clean install -Dmaven.test.skip=true -T 1.5C

FROM  amazoncorretto:17.0.7

COPY --from=application /tmp/target/Backoffice.jar /usr/src
WORKDIR /usr/src
CMD java -Xms256M -Xmx256M -Xss1024k -XX:ReservedCodeCacheSize=64M -XX:CodeCacheExpansionSize=512k -XX:MaxDirectMemorySize=64M -XX:CompressedClassSpaceSize=32M -XX:MaxMetaspaceSize=128M -XX:+PerfDisableSharedMem -XX:MaxRAM=512M -XX:ActiveProcessorCount=2 -jar Backoffice.jar
EXPOSE 8080