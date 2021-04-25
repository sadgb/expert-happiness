# frozen_string_literal: true

module Database
  module FriendRequests
    class FromHash
      def self.call(result)
        return nil unless result

        fr = FriendRequest.new
        FriendRequest::QUERY_ATTRIBUTES.each do  |attr|
          fr.send "#{attr}=", result[attr.to_s]
        end

        fr
      end
    end
  end
end
