
plugins {
    application
    kotlin("jvm") version "1.8.0"
}

group = "ru.sjbody"
version = "1.0-DEVELOPMENT"

repositories {
    mavenCentral()
}

application {
    mainClass.set("io.ktor.server.tomcat.EngineMain")
}

dependencies {
    val ktorVersion = "2.2.2"
    val exposedVersion= "0.40.1"
    val exposedJavaTimeVersion = "0.40.1"
    val hikariVersion = "5.0.1"
    val postgresVersion = "42.1.4"

    testImplementation(kotlin("test"))

    /**
     * KTor dependencies
     */
    implementation("io.ktor:ktor-client-core:$ktorVersion")
    implementation("io.ktor:ktor-client-cio:$ktorVersion")
    implementation("io.ktor:ktor-client-jackson:$ktorVersion")
    implementation("io.ktor:ktor-server-core:$ktorVersion")
    implementation("io.ktor:ktor-server-content-negotiation:$ktorVersion")
    implementation("io.ktor:ktor-serialization-gson:$ktorVersion")
    implementation("io.ktor:ktor-serialization-kotlinx-json:$ktorVersion")
    implementation("io.ktor:ktor-server-tomcat-jvm:$ktorVersion")
    implementation("io.ktor:ktor-server-cors:$ktorVersion")

    /**
     * Database dependencies
     */
    implementation("org.jetbrains.exposed:exposed-core:$exposedVersion")
    implementation("org.jetbrains.exposed:exposed-dao:$exposedVersion")
    implementation("org.jetbrains.exposed:exposed-jdbc:$exposedVersion")
    implementation("org.jetbrains.exposed:exposed-java-time:$exposedJavaTimeVersion")
    implementation("org.postgresql:postgresql:$postgresVersion")
    implementation("com.zaxxer:HikariCP:$hikariVersion")
}

tasks.test {
    useJUnitPlatform()
}

kotlin {
    jvmToolchain(8)
}