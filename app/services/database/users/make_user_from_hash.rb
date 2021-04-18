# frozen_string_literal: true

module Database
  module Users
    class MakeUserFromHash
      def self.call(result)
        return nil unless result

        user = User.new
        User::QUERY_ATTRIBUTES.each do  |attr|
          user.send "#{attr}=", result[attr.to_s]
        end

        user
      end
    end
  end
end
