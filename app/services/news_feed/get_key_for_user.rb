module NewsFeed
  class GetKeyForUser
    def self.call(user_id)
      "USER_#{user_id}_FEED"
    end
  end
end