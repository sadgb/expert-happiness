# frozen_string_literal: true

module Database
  module FriendRequests
    class All
      def self.call
        DbConnection.execute do |client|
          data = client.query('select * from friend_requests').to_a

          data.collect do |hash|
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
end
