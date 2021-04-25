class FriendRequest


  QUERY_ATTRIBUTES = %i[from_user_id to_user_id updated_at created_at].freeze
  QUERY_ATTRIBUTES_STRING = QUERY_ATTRIBUTES.join(',').freeze

  attr_accessor(*QUERY_ATTRIBUTES)
end
