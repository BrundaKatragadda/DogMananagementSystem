FROM maven:3-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -Pprod -DskipTests
FROM eclipse-temurin:17-alpine
COPY --from=build /target/DogMananagementSystem-0.0.1-SNAPSHOT.jar DogMananagementSystem.jar
EXPOSE 8080
CMD ["java", "-jar", "DogMananagementSystem.jar"]