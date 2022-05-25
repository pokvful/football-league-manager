db.createUser(
  {
    user: "transport",
    pwd:  "Tr@nsport123!",
    roles: [ { role: "readWrite", db: "flm" } ]
  }
)
