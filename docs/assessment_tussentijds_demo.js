// Er is genoeg overgenomen
db.POSITION.find().count()

// Ook de goede data is overgenomen
db.POSITION.find().limit(3)

// Ook de views worden overgenomen
db.VW_GET_PLAYROUND_DATA.find().count()