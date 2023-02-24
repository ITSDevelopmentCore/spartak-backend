package dao

import kotlinx.coroutines.*
import model.database.Programs
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.*
import org.jetbrains.exposed.sql.transactions.experimental.*

object DatabaseFactory {

    fun init() {
        val driverClassName = "org.postgresql.Driver"
        val jdbcURL = "jdbc:postgresql://localhost:5432/postgres?currentSchema=spartak-db"
        val database = Database.connect(
            jdbcURL,
            driverClassName,
            user = "admin",
            password = "admin")


        transaction(database) {
            SchemaUtils.create(Programs)
        }
    }

}

suspend fun <T> dbQuery(block: suspend () -> T): T =
    newSuspendedTransaction(Dispatchers.IO) { block() }