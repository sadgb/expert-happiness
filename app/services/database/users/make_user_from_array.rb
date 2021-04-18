# frozen_string_literal: true

module Database
  module Users
    class MakeUserFromArray
      def self.call(result)
        return nil unless result

        user = User.new
        User::QUERY_ATTRIBUTES.each_with_index do |attr, i|
          user.send "#{attr}=", result[i]
        end

        user
      end
    end
  end
end
