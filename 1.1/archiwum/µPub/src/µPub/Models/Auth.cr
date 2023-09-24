module Model
  class IndieAuth

    def self.is_client_known?(client : String)
      DB.open DATABASE do |db|
        db.query_one? "SELECT code FROM Auth WHERE client_id == (?)", client, as: String
      end
    end

    def self.auth_code(code, client_id)
      DB.open DATABASE do |db|
        db.exec "UPDATE Auth SET code = (?) WHERE client_id = (?)", code, client_id
      end
    end

    def self.read_auth_code(client_id)
      DB.open DATABASE do |db|
        db.query_one "SELECT code FROM Auth WHERE client_id = (?)", client_id as: String
      end
    end

  end
end
