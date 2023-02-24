package plugin

import dao.dao
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*


fun Application.configureRouting() {
    routing() {
        userPrograms()
        programs()
    }
}

private fun Route.userPrograms()
{
    route("/userPrograms")
    {
        get {
            call.respond(dao.allPrograms())
        }
    }
}

private fun Route.programs()
{
    route("/programs")
    {
        get {
            call.respond(dao.allPrograms())
        }
    }
}



