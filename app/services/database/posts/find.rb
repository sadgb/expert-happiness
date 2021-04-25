# frozen_string_literal: true

module Database
  module Posts
    class Find
      def self.call(post_id )
        return nil if post_id.blank?

        DbConnection.execute do |client|
          statement = client.prepare("select #{Post::QUERY_ATTRIBUTES_STRING} from posts where id = ?")
          data = statement.execute(post_id).to_a.last
          MakePostFromHash.call(data)
        end
      end
    end
  end
end
