# frozen_string_literal: true

module Database
  module FriendRequests
    class RemoveIfExists
      def self.call(from_user_id, to_user_id)
        DbConnection.execute do |client|
          statement = client.prepare('delete from friend_requests where from_user_id = ? and to_user_id = ?;')

          statement.execute(from_user_id, to_user_id)
        end

        true
      end
    end
  end
end
