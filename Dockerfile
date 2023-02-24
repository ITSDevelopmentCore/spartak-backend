FROM gradle:7-jdk11 AS build
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle buildFatJar --no-daemon

FROM openjdk:11
EXPOSE 8080:8080
RUN mkdir /app
COPY --from=build /home/gradle/src/build/libs/*.jar /app/ktor-docker-sample.jar
COPY db-init.sql /docker-entrypoint-initdb.d/
RUN apt-get update && \
    apt-get install -y postgresql && \
    service postgresql start && \
    su postgres -c "psql -f /docker-entrypoint-initdb.d/db-init.sql" && \
    service postgresql stop
ENTRYPOINT ["java","-jar","/app/ktor-docker-sample.jar"]