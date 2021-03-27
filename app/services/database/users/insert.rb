module Database
  module Users
    class Insert
      # @param [User] user
      def self.call(user)

        attrs = User::INSERT_ATTRIBUTES
        params = attrs.collect{|attr| user.send attr}

        DbConnection.execute do |client|

          statement = client.prepare("insert into users (#{attrs.join(', ')}, created_at, updated_at)
values( #{'?,' * attrs.length} NOW(), NOW());")

          statement.execute(*params)

          # this is last inserted id by our connection so this should work
          # regarding to stackoverflow
          data = client.query('SELECT LAST_INSERT_ID() as id').to_a
          user.id = data.last['id']
        end
      end
    end
  end
end
