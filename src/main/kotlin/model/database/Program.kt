package model.database

import org.jetbrains.annotations.NotNull
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.javatime.timestamp
import java.time.Instant
import java.time.LocalDate
import java.time.LocalDateTime

data class Program(
    @NotNull val title : String,
    @NotNull val imageUrl : String,
    @NotNull val price : Double,
    @NotNull val contentUrl : String,
    @NotNull val description : String,
)

object Programs : Table() {
    val id = integer("id").autoIncrement()
    val creationDate = timestamp("creation_date").default(Instant.now())
    val title = varchar("title", 32)
    val imageUrl = varchar("image_url", 256)
    val price = double("price")
    val contentUrl = varchar("content_url",256)
    val description = varchar("description", 1024)

    override val primaryKey = PrimaryKey(id)
}
