//1)

db.sales.aggregate([
    {
        $match : {"customer.gender":{$eq : "M"}}
    },
    {
        $match : {"storeLocation": { $in: [ "London","San Diego" ,"Austin" ] }}
    },
    {
        $match : {"customer.age": {$gte : 18}}
    },
    {
        $match : {"items.price" : {$gte :  NumberDecimal("1000")}}
    },
    {
        $match : {"items.tags": {$in : ["school", "kids"]}}
    },
    {
        $project : {"_id": 0, "sale": "$_id", "saleDate": 1, "storeLocation": 1, "email": "$customer.email"}
    }

])


db.sales.find({"_id" : ObjectId("5bd761dcae323e45a93cd194")},{})


//2)

db.sales.aggregate([
    {
        $match : {"storeLocation": { $in: ["Seattle"] }}
    },
    {
        $match : {"purchaseMethod": { $in: ["In store", "Phone"]}}
    },
    {
        $match :{"saleDate": { $gte: ISODate("2014-02-01T00:00:00Z"),$lte: ISODate("2015-01-31T23:59:59Z")}}
    },
    {
        $unwind : "$items"
    },
    {
        $addFields : {"totalAmount": {$multiply:["$items.quantity", "$items.price"]}}
    },
    {
        $group : {
            "_id" : "$_id", 
            "mail": {$first: "$customer.email"},
            "satisfaction": {$first :"$customer.satisfaction"},
            "total" : {$sum : "$totalAmount"}
        }

    },
    {
        $sort : {"satisfaction": -1, "mail": 1}
    },
    {
        $project : {"_id": 0, "mail": 1, "satisfaction": 1, "total": 1,  }
    }

])


//3)


db.createView(
    "salesInvoiced",
    "sales",
    [
    ]
    )


db.sales.aggregate([
    {
        $unwind: "$items"
    },
    {
        $addFields : {"totalAmount": {$multiply:["$items.quantity", "$items.price"]}}
    },
    {
        $group : {
            "_id" : "$_id", 
            "fecha": {$first:"$saleDate"},
            "total" : {$sum : "$totalAmount"}
        }

    },
    {
        $group : {
            "_id": {"month": {$month: "$fecha"},"year": {$year: "$fecha"} },
            "monto_total" : { $sum : "$total"},
            "monto_minimo": { $min: "$total"},
            "monto_maximo": {$max : "$total"},
            "monto_promedio": {$avg: "$total"}

        }
    },
    {
        $sort : {"_id.year":1, "_id.month": 1}
    },
    {
        $project: {"_id": 0,"month": "$_id.month", "year": "$_id.year","monto_total": 1, "monto_minimo": 1,
                    "monto_maximo": 1, "monto_promedio": 1}
    }
])

//4)
db.sales.aggregate([
    {
        $unwind : "$items"
    },
    {
        $addFields : {"totalAmount": {$multiply:["$items.quantity", "$items.price"]}}
    },
    {
        $group : {
            "_id" : "$_id", 
            "storeLocation": {$first: "$storeLocation"},
            "total" : {$sum : "$totalAmount"}
        }

    },
    {
        $lookup: {
        from: "storeObjectives",
        localField: "storeLocation",
        foreignField: "_id",
        as: "store"
        }   
    },
    {
        $group: {
            "_id": "$store._id",
            "avg_income": {$avg : "$total"},
            "objective": {$first : "$store.objective"}
        }
    },
    {
        $addFields: {"Location": { $arrayElemAt: [ "$_id", 0 ]}, "objective_income":{ $arrayElemAt: [ "$objective", 0 ]} }
    },
    {
        $project: {"_id":0,"Location": 1, "avg_income":1, "objective_income": 1, "difference": { $subtract: [ "$avg_income", "$objective_income" ]}}
    }
])

//5)

db.runCommand( {
    collMod: "sales",
    validator: { 
           $jsonSchema: {
              bsonType: "object",
              required: ["saleDate", "storeLocation","purchaseMethod", "customer"],
              properties: {
                 salesDate: {
                    bsonType: "date",
                    description: "Debe ser una fecha",
                 },
                 storeLocation: {
                    bsonType : "string",
                    description : "solo ubicaciones validas",
                    enum : ["London","San Diego", "Seattle", "Austin", "New York", "Denver"]
                 },
                 purchaseMethod :{
                    bsonType : "string",
                    description: "solo metodos validos",
                    enum : ["In store", "Online", "Phone"]
                 },
                 customer:{
                    bsonType : "object",
                    description: "solo campos validos",
                    required: ["gender","age", "email", "satisfaction"],
                    properties: {
                        age: {
                        bsonType: "int",
                        description: "Debe ser una fecha",
                        minimum : 1,
                        maximum : 100
                     },
                     gender: {
                        bsonType : "string",
                        description : "solo sexos validos",
                        enum : ["M", "F"]
                     },
                     email :{
                        bsonType : "string",
                        pattern : " ^\S+@\S+$",
                        description: "mails validos",
                     },
                     satisfaction:{
                        bsonType : "int",
                        minimum : 1,
                        maximum : 5,
                        description : "puntuacion del 1 al 5"
                     }

                 }

            
            }
        }
    }
},
validationLevel: "strict",
validationAction: "error"
})       

//EJEMPLO INVALIDO
db.sales.insertOne(
    {
        "saleDate" : ISODate(),

        "storeLocation" : 19, // es un numero 
        "customer" : {
            "gender" : "M",
            "age" : 42,
            "email" : "cauho@witwuta.sv",
            "satisfaction" : 4
        },
        "purchaseMethod" : "Online"
    }
)

//ejemplo valido

db.sales.insertOne(
{
	"saleDate" : ISODate(),
	"storeLocation" : "Denver", // todo ok
	"customer" : {
		"gender" : "M",
		"age" : 42,
		"email" : "cauho@witwuta.sv",
		"satisfaction" : 4
	},
	"purchaseMethod" : "Online"
}
)
