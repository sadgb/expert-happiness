# frozen_string_literal: true

module Database
  module Users
    class Find
      def self.call(from_user_id, to_user_id)

        DbConnection.execute do |client|
          statement = client.prepare('select * from friend_requests where from_user_id = ? and to_user_id = ?')
          data = statement.execute(from_user_id, to_user_id).to_a.last

          return nil unless data

          fr = FriendRequest.new
          FriendRequest::QUERY_ATTRIBUTES.each do  |attr|
            fr.send "#{attr}=", hash[attr.to_s]
          end
          fr
        end
      end
    end
  end
end
