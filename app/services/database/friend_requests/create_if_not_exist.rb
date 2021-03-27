# frozen_string_literal: true

module Database
  module FriendRequests
    class CreateIfNotExist
      def self.call(from_user_id, to_user_id)
        DbConnection.execute do |client|
          statement = client.prepare('INSERT IGNORE INTO friend_requests SET from_user_id = ?, to_user_id = ?;')

          statement.execute(from_user_id, to_user_id)
        end

        true
      end
    end
  end
end
