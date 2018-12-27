FROM openjdk:8-jdk-alpine
VOLUME /tmp
#ARG JAR_FILE
#COPY ${JAR_FILE} app.jar
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
ENTRYPOINT ["java","-cp","app:app/lib/*","hello.Application"]