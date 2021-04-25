module NewsFeed
  class GetFeedForUser
    def self.call(user_id)
      key = cache_key(user_id)

      Rails.cache.fetch key, expires_in: 10.hours do
        Database::Posts::FetchPostsFeedForUser.call(user_id)
      end
    end

    def self.cache_key(user_id)
      "USER_#{user_id}_FEED"
    end
  end
end