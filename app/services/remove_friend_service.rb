class RemoveFriendService

  # @param [User] user - who is removing a friend
  # @param [integer] user_id - who should be removed as a friend
  def self.call(user, user_id)
    return if user.nil? || user_id.nil?

    Database::FriendRequests::RemoveIfExists.call(user.id, user_id)
  end
end