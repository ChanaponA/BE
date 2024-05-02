#Backend

FROM maven:3.8.4-openjdk-17 as builder
 
COPY . /usr/src/app
 
WORKDIR /usr/src/app
 
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk

COPY --from=builder /usr/src/app/target/*.jar /app/app.jar

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
