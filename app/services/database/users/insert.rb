module Database
  module Users
    class Insert
      # @param [User] user
      def self.call(user)

        DbConnection.execute do |client|

          statement = client.prepare("insert into users (name, surname, age, pwd, gender, created_at, updated_at)
values( ?, ?, ?, ?, ?, NOW(), NOW());")

          statement.execute(user.name,
                            user.surname,
                            user.age,
                            user.password_hash,
                            user.gender
          )

          # this is last inserted id by our connection so this should work
          # regarding to stackoverflow
          data = client.query('SELECT LAST_INSERT_ID() as id').to_a
          user.id = data.last['id']
        end
      end
    end
  end
end
