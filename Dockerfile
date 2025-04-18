FROM openjdk:17-jdk-slim
VOLUME /tmp
ARG JAR_VERSION=1.0.0
COPY target/hello-service-${JAR_VERSION}.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
