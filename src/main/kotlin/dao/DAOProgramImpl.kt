package dao

import kotlinx.coroutines.runBlocking

import model.database.Program
import model.database.Programs
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq

class DAOProgramImpl : DAOProgram {

    private fun resultRowToProgram(row: ResultRow) = Program(
        title = row[Programs.title],
        imageUrl= row[Programs.imageUrl],
        description= row[Programs.description],
        price= row[Programs.price],
        contentUrl = row[Programs.contentUrl],
    )

    override suspend fun allPrograms(): List<Program> = dbQuery {
        Programs.selectAll().map(::resultRowToProgram)
    }

    override suspend fun program(id: Int): Program? = dbQuery {
        Programs
            .select { Programs.id eq id }
            .map(::resultRowToProgram)
            .singleOrNull()
    }

    override suspend fun addNewProgram(
        title: String,
        imageUrl: String,
        price : Double,
        contentUrl : String,
        description : String, ): Program? = dbQuery {

        val insertStatement = Programs.insert {
            it[Programs.title] = title
            it[Programs.imageUrl] = imageUrl
            it[Programs.description] = description
            it[Programs.price] = price
            it[Programs.contentUrl] = contentUrl
        }

        insertStatement.resultedValues?.singleOrNull()?.let(::resultRowToProgram)
    }

    override suspend fun editProgram(id: Int,
                                     title: String,
                                     imageUrl: String,
                                     price : Double,
                                     contentUrl : String,
                                     description : String): Boolean = dbQuery {

        Programs.update({ Programs.id eq id }) {
            it[Programs.title] = title
            it[Programs.imageUrl] = imageUrl
            it[Programs.description] = description
            it[Programs.price] = price
            it[Programs.contentUrl] = contentUrl
        } > 0
    }

    override suspend fun deleteProgram(id: Int): Boolean = dbQuery {
        Programs.deleteWhere { Programs.id eq id } > 0
    }
}


val dao: DAOProgram = DAOProgramImpl().apply {
    runBlocking {
        if(allPrograms().isEmpty()) {
            addNewProgram(
                title = "Тестовая программа 1",
                imageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/640px-Telegram_2019_Logo.svg.png",
                description = "Описание тестовой программы 1",
                price = 4900.0,
                contentUrl = "https://sjbody.ru/ganteli1")

            addNewProgram(
                title = "Тестовая программа 2",
                imageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/640px-Telegram_2019_Logo.svg.png",
                description = "Описание тестовой программы 2",
                price = 9900.0,
                contentUrl = "https://sjbody.ru/ganteli1")

            addNewProgram(
                title = "Тестовая программа 3",
                imageUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Telegram_2019_Logo.svg/640px-Telegram_2019_Logo.svg.png",
                description = "Описание тестовой программы 3",
                price = 9900.0,
                contentUrl = "https://sjbody.ru/ganteli1")
        }
    }
}