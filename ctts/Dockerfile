# 第一阶段：构建阶段
FROM maven:3.9.6-eclipse-temurin-21 AS builder
WORKDIR /build
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# 第二阶段：运行阶段
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /build/target/*.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]