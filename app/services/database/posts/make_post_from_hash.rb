# frozen_string_literal: true

module Database
  module Posts
    class MakePostFromHash
      def self.call(result)
        return nil unless result

        user = Post.new
        Post::QUERY_ATTRIBUTES.each do  |attr|
          user.send "#{attr}=", result[attr.to_s]
        end

        user
      end
    end
  end
end
