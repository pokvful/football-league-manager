db.createUser(
  {
    user: "data-analist",
    pwd:  "Football@",
    roles: [ { role: "read", db: "flm" } ]
  }
)
