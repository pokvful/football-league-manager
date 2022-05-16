db.createUser(
  {
    user: "data-analist",
    pwd:  "Football@",
    roles: [ { role: "read", db: "flm" } ]
  }
),

db.createUser(
  {
    user: "transport",
    pwd:  "Tr@nsport123!",
    roles: [ { role: "create, drop", db: "flm" } ]
  }
)