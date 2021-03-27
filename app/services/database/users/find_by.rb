# frozen_string_literal: true

module Database
  module Users
    class FindBy
      def self.call(email: )
        return nil if email.blank?

        DbConnection.execute do |client|
          statement = client.prepare('select * from users where lower(email) = ?')
          data = statement.execute(email.downcase).to_a.last

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
