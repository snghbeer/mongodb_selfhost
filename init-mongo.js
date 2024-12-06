db = db.getSiblingDB("admin");
db.createUser(
    {
        user: "UserPass",
        pwd: "UserName",
        roles: [
            {
                role: "root",
                db: "admin"
            }
        ]
    }
);
