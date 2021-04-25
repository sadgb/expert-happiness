# frozen_string_literal: true

module Database
  module FriendRequests
    class FindByToUserId
      def self.call(to_user_id)
        DbConnection.execute do |client|
          statement = client.prepare("select #{FriendRequest::QUERY_ATTRIBUTES_STRING} " \
                                       'from friend_requests ' \
                                       'where to_user_id = ?')
          data = statement.execute(to_user_id).to_a

          data.collect do |hash|
            FromHash.call(hash)
          end
        end
      end
    end
  end
end
