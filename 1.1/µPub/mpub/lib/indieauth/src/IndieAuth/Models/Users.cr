class Model
def self.get_user_fullname(name : String)
      DB.open DATABASE do |db|
        db.query_one "SELECT fullname FROM Users WHERE username == (?)", name, as: String | Nil
      end
    end

    def self.get_user_avatar(name : String)
      DB.open DATABASE do |db|
        db.query_one "SELECT photo FROM Users WHERE username == (?)", name, as: String | Nil
      end
    end

    def self.get_user_homepage(name : String)
      DB.open DATABASE do |db|
        db.query_one "SELECT url FROM Users WHERE username == (?)", name, as: String | Nil
      end
    end

    def self.get_user_bio(name : String)
      DB.open DATABASE do |db|
        db.query_one "SELECT bio FROM Users WHERE username == (?)", name, as: String | Nil
      end
    end
end
