class AddFriendService

  # @param [User] user - who is adding a friend
  # @param [integer] user_id - who should be added as a friend
  def self.call(user, user_id)
    return if user.nil? || user_id.nil?

    Database::FriendRequests::CreateIfNotExist.call(user.id, user_id)
  end
end