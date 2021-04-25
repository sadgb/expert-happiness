module NewsFeed
  class InvalidateFeedForUserFollowers
    def self.call(user_id)

      followers = Database::FriendRequests::FindByToUserId.call(user_id)

      followers.each do |fr|
        InvalidateFeedForUser.call(fr.from_user_id)
      end
    end
  end
end