// SHOW
//show dbs
//use myBase
//show collections

//db.products.remove({}) // @deprecated. keep indexes
db.products.drop() // no indexes

// INSERT
db.products.insertOne( { item: "card", qty: 15 } );
db.products.insertMany( [
    { item: "card2", qty: 12 },
    { items: "bags", qty: 35, test: 8 }
] )

// DELETE
db.products.insertOne( { toBeDeleted: "1", withData: { "test": "specificData" }} )
db.products.deleteMany( { withData: { "test": "specificData" }} )

// UPDATE
db.products.updateOne(
    { item: "card2" },
    { $set: { item: "card3" }}
)
db.products.updateMany (
    { item: "card3" },
    { $set: { item: "card4" }}
)

// FIND + REGEX
db.products.findOne(
    { items: "bags" }
)
db.products.find(
    { item: { $regex: /^c/ }}
)
db.products.find({
    $expr: {
        $regexMatch: {
           "input": {$toString: "$qty"}, 
           "regex": /5$/ 
        }
    }
})