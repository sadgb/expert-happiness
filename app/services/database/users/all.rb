# frozen_string_literal: true

module Database
  module Users
    class All
      def self.call
        data = ActiveRecord::Base.connection.execute('select * from users').to_a

        data.collect do |user_hash|
          MakeUserFromArray.call(user_hash)
        end
      end
    end
  end
end
