require "sqlite3"

get "/database/create" do
    DB.open "sqlite3://./data.db" do |db|
        "POST    = CREATE
        PUT      = UPDATE
        REMOVE   = DELETE
        RESTORE  = UNDELETE"
    db.exec "CREATE TABLE IF NOT EXISTS Auth (
	    client_id	TEXT NOT NULL UNIQUE,
        timestamp   TEXT NOT NULL,
	    POST	    INTEGER NOT NULL DEFAULT 0,
	    PUT 	    INTEGER NOT NULL DEFAULT 0,
	    REMOVE	    INTEGER NOT NULL DEFAULT 0,
	    RESTORE 	INTEGER NOT NULL DEFAULT 0
)"
    end
end
