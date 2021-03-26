# frozen_string_literal: true

module Database
  module Users
    class Find
      # @param [Integer] user_id
      def self.call(user_id)
        user_id = user_id.to_i
        return nil if user_id.negative?

        DbConnection.execute do |client|
          statement = client.prepare('select * from users where id = ?')
          data = statement.execute(user_id).to_a.last

          return nil unless data

          user = User.new
          User::QUERY_ATTRIBUTES.each do  |attr|
            user.send "#{attr}=", data[attr.to_s]
          end

          user
        end
      end
    end
  end
end
