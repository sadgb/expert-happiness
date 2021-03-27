class CheckFriendsService
  def self.call(user_id_1, user_id_2)
    return if user_id_1.nil? || user_id_2.nil?

    # TODO could be done in a single query
    Database::FriendRequests::Find.call(user_id_1, user_id_2) &&
      Database::FriendRequests::Find.call(user_id_2, user_id_1)
  end
end