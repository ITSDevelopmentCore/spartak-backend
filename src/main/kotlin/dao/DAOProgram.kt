package dao

import model.database.Program

interface DAOProgram {

    suspend fun allPrograms(): List<Program>

    suspend fun program(id: Int): Program?

    suspend fun addNewProgram(name : String,
                              imageUrl : String,
                              price : Double,
                              contentUrl : String,
                              description : String) : Program?

    suspend fun editProgram(id: Int,
                            name : String,
                            imageUrl : String,
                            price : Double,
                            contentUrl : String,
                            description : String) : Boolean

    suspend fun deleteProgram(id: Int): Boolean

}