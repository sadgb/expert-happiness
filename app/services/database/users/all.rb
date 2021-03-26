# frozen_string_literal: true

module Database
  module Users
    class All
      def self.call
        DbConnection.execute do |client|
          data = client.query('select * from users').to_a

          data.collect do |user_hash|
            user = User.new
            User::QUERY_ATTRIBUTES.each do  |attr|
              user.send "#{attr}=", user_hash[attr.to_s]
            end
            user
          end
        end
      end
    end
  end
end
