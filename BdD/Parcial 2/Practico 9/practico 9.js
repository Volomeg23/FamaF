//1)

db.createCollection("users", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: [ "name", "password", "email" ],
            properties: {
                name: {
                    bsonType: "string",
                    maxLength: 30,
                    description: "full name of the user and is required"
                },
                email: {
                    bsonType: "string",
                    pattern: "^(.*)@(.*)\\.(.{2,4})$",
                    description: "email of the user and is required"
                },
                password: {
                    bsonType: "string",
                    minLength: 50,
                    description: "password of the user and is required"
                }
            }
        }
    }
} )


//2)

db.getCollectionInfos({"name" : "users"})

//3)

db.runCommand( {
    collMod: "theaters",
    validator: { 
           $jsonSchema: {
              bsonType: "object",
              required: ["theaterId", "location"],
              properties: {
                 theaterId: {
                    bsonType: "int",
                    description: "Debe ser un entero.",
                 },
                 location: {
                    bsonType: "object",
                    description: "ubicacion",
                    required: ["address"],
                    properties: {
                       address: {
                          bsonType: "object",
                          description: "Debe ser un objeto con campos street1, city, state y zipcode, todos de tipo string y requeridos.",
                          required: ["street1", "city", "state", "zipcode"],
                          properties: {
                             street1: {
                                bsonType: "string",
                                description: "Campo street1 requerido y debe ser un string.",
                             },
                             city: {
                                bsonType: "string",
                                description: "Campo city requerido y debe ser un string.",
                             },
                             state: {
                                bsonType: "string",
                                description: "Campo state requerido y debe ser un string.",
                             },
                             zipcode: {
                                bsonType: "string",
                                description: "Campo zipcode requerido y debe ser un string.",
                             },
                          }
                       },
                       geo: {
                          bsonType: "object",
                          description: "Puede ser un objeto con campos type y coordinates.",
                          properties: {
                             type: {
                                bsonType: ["string", "null"],
                                description: "Campo type puede ser un string o null.",
                                enum: ["Point", null]
                             },
                             coordinates: {
                                bsonType: "array",
                                description: "Campo coordinates puede ser un array de 2 doubles o null.",
                                maxItems : 2,
                                items : {
                                    bsonType :"double"

                                }
                             }
                          }
                        }
                    }
                }
            }
        }
    },
    validationLevel: "strict",
    validationAction: "warn"

})
     

//4)

db.runCommand( {
    collMod: "movies",
    validator: { 
           $jsonSchema: {
              bsonType: "object",
              required: ["title", "year"],
              properties: {
                 title: {
                    bsonType: "string",
                    description: "Debe ser un string",
                 },
                 year: {
                    bsonType : "int",
                    minimum : 1900,
                    maximum : 3000,
                    description : "entero entre 1900 y 3000"
                 },
                 cast :{
                    bsonType : "array",
                    description: "Debe ser un array de strings sin duplicados.",
                    uniqueItems: true,
                    items: {
                       bsonType: "string"
                    }
                 },
                 directors :{
                    bsonType : "array",
                    description: "Debe ser un array de strings sin duplicados.",
                    uniqueItems: true,
                    items: {
                       bsonType: "string"
                    }
                 },
                 countries:{
                    bsonType : "array",
                    description: "Debe ser un array de strings sin duplicados.",
                    uniqueItems: true,
                    items: {
                       bsonType: "string"
                    }
                 },
                 genres :{
                    bsonType : "array",
                    description: "Debe ser un array de strings sin duplicados.",
                    uniqueItems: true,
                    items: {
                       bsonType: "string"
                    }
                 }
            
            }
        }
    }
})       



//5)


db.createCollection("userProfiles", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: [ "user_id", "language"],
            properties: {
                user_id: {
                    bsonType: "objectId",
                    description: "full name of the user and is required"
                },
                language: {
                    bsonType: "string",
                    enum: ["English", "Spanish", "Portuguese"],
                    description: "email of the user and is required"
                },
                favorite_genres: {
                    bsonType : "array",
                    description: "Debe ser un array de strings sin duplicados.",
                    uniqueItems: true,
                    items: {
                       bsonType: "string"
                    }
                }
            }
        }
    }
} )
































db.users.aggregate([
    {
      $lookup: {
        from: "comments",
        localField: "name",
        foreignField: "name",
        as: "comments"
      }
    },
    {
      $unwind: "$comments"
    },
    {
      $lookup: {
        from: "movies",
        localField: "comments.movie_id",
        foreignField: "_id",
        as: "movie_ref"
      }
    },
  {
      $unwind: "$movie_ref"
  },
    {
      $match: {
        $expr: {
          $and: [
            { $eq: [{ $month: "$comments.date" }, { $month: "$movie_ref.released" }] },
            { $eq: [{ $year: "$comments.date" }, { $year: "$movie_ref.released" }] }
          ]
        }
      }
    },
    {
      $project: {
        _id: 0,
        name: 1,
        email: 1,
        "comments.date": 1,
        "movie_ref.title": 1,
        "movie_ref.released": 1
      }
    }
  ])

//6)
//en comments se uso referencias a la coleccion movies por el campo movie_id que hace referencia a la _id de la coleccion movies
//este es una relacion One-to-Many ya que puede haber varios comentarios sobre una misma pelicula
//tambien una relacion One-to-many con usuarios

//en la coleccion movies podriamos identificar una relacion One-to-One usando documentos anidados en el atributo imdb que almacena la id del archivo imdb
//tambien podriamos decir que tiene una relacion One-to-many con cast


//7

//1 para esta query se podria agregar en la coleccion books un arreglo de category_id con todas las referencias a las categorias
//otra forma mas eficiente seria sacar la tabala categories y meter el nombre de las categorias directamente en books

//2 para este simplemente podriamos añadir un campo mas a categories que contenga un arreglo de books_id haciendo referencia a todos los libros que
//tengan esa categoria

//3 para este podriamos añadir un campo mas a orders que contenga ids de order_details, con esto solo tendriamos que desglozar ese arreglo, acceder a cada relacion
// de esta y hacer una sumatoria de todos los order_details.quantity * order_details.price

//8

