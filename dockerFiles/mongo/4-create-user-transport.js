db.createUser(
  {
    user: "transport",
    pwd:  "Tr@nsport123!",
    roles: [ { role: "create, drop", db: "flm" } ]
  }
)
