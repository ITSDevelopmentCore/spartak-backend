package plugin

import io.ktor.server.application.*
import io.ktor.server.plugins.cors.routing.*
import io.ktor.server.routing.*

fun Application.configureCorsPolicy() {
    install(CORS) {
        anyHost()
    }
}


