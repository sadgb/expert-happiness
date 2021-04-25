# frozen_string_literal: true

class Post
  INSERT_ATTRIBUTES = %i[user_id text].freeze
  QUERY_ATTRIBUTES = INSERT_ATTRIBUTES + %i[id updated_at created_at].freeze
  QUERY_ATTRIBUTES_STRING = QUERY_ATTRIBUTES.join(',').to_s

  attr_accessor(*QUERY_ATTRIBUTES)
  attr_reader :errors
end
