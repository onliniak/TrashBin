require "sqlite3" # Otherwise, it will not work without starting the server
require "./config.cr"

module Model
  class Migrations
    def initialize
      users
      auth
    end

    def create_table(table : String, query : String, mysql = false)
      DB.open DATABASE do |db|
        if mysql == false
          db.exec("CREATE TABLE IF NOT EXISTS #{table}(#{query})")
        else
          db.exec("CREATE TABLE IF NOT EXISTS #{table}(ID INT NOT NULL AUTO_INCREMENT, #{query}, PRIMARY KEY (ID))"
          )
        end
      end
    end

    def users
      create_table("Users",
        "
username VARCHAR(16),
fullname VARCHAR(32),
url VARCHAR(70),
photo VARCHAR(150),
bio VARCHAR(160)
"
      )
    end

    def auth
      create_table("Auth",
        "
client_id VARCHAR(64),
code VARCHAR(48),
token VARCHAR(128),
POST INT(1) DEFAULT 0,
PUT INT(1) DEFAULT 0,
REMOVE INT(1) DEFAULT 0,
RESTORE INT(1) DEFAULT 0
"
      )
    end
  end

  Migrations.new
end
