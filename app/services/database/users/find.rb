# frozen_string_literal: true

module Database
  module Users
    class Find
      # @param [Integer] user_id
      def self.call(user_id)
        user_id = user_id.to_i
        return nil if user_id.negative?

        data = ActiveRecord::Base.connection.execute("select #{User::QUERY_ATTRIBUTES_STRING} from users where id = #{user_id}").to_a.last

        MakeUserFromArray.call(data)
      end
    end
  end
end
