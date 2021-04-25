module NewsFeed
  class InvalidateFeedForUser
    def self.call(user_id)
      key = GetKeyForUser.call(user_id)

      Rails.cache.delete key
    end
  end
end