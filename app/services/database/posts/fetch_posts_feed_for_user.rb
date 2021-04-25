# frozen_string_literal: true

module Database
  module Posts
    class FetchPostsFeedForUser
      def self.call(user_id: )
        return nil if user_id.blank?

        DbConnection.execute do |client|
          statement = client.prepare("select #{Post::QUERY_ATTRIBUTES_STRING} from posts where user_id in
      (select to_user_id from friend_requests where from_user_id = ?)
 order by created_at desc LIMIT 1000")
          data = statement.execute(user_id).to_a

          data.collect do |hash|
            MakePostFromHash.call(hash)
          end
        end
      end
    end
  end
end
