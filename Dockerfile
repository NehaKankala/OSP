# Use Maven to build the project
FROM maven:3.8.5-openjdk-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package

# Use Tomcat to run the WAR
FROM tomcat:9.0
COPY --from=build /app/target/OSP.war /usr/local/tomcat/webapps/ROOT.war
