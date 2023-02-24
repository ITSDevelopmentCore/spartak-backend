import dao.DatabaseFactory
import plugin.configureRouting
import plugin.configureSerialization
import io.ktor.server.application.*

import plugin.configureCorsPolicy


fun main(args: Array<String>) = io.ktor.server.tomcat.EngineMain.main(args);

fun Application.moduleCore(){
    DatabaseFactory.init()

    configureRouting()
    configureSerialization()
    configureCorsPolicy()
}
