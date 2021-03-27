class FriendRequest


  QUERY_ATTRIBUTES = %i[from_user_id to_user_id updated_at created_at].freeze

  attr_accessor(*QUERY_ATTRIBUTES)
end
