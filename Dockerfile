FROM maven:3-eclipse-temurin-21 as build
WORKDIR /app
COPY pom.xml .
RUN mvn -q dependency:go-offline

From eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8762
ENTRYPOINT["java", "-jar", "app.jar"]