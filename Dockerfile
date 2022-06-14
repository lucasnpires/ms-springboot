FROM maven:3.6-jdk-11 AS builder
WORKDIR /build
COPY . /build
RUN mvn clean package

FROM openjdk:11
COPY --from=builder /build/target/*.jar /app.jar
EXPOSE 8888
ENTRYPOINT ["java","-jar","/app.jar"]