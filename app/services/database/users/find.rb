# frozen_string_literal: true

module Database
  module Users
    class Find
      # @param [Integer] user_id
      def self.call(user_id)
        user_id = user_id.to_i
        return nil if user_id.negative?

        data = ActiveRecord::Base.connection.execute("select * from users where id = #{user_id}").to_a.last

        return nil unless data

        user = User.new
        User::QUERY_ATTRIBUTES.each_with_index do |attr, i|
          user.send "#{attr}=", data[i]
        end

        user
      end
    end
  end
end
