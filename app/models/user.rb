# frozen_string_literal: true

class User
  GENDERS = {
    male: 1,
    female: 2,
    other: 3
  }.freeze

  INSERT_ATTRIBUTES = %i[name surname email gender age password_hash city about].freeze
  QUERY_ATTRIBUTES = INSERT_ATTRIBUTES + %i[id updated_at created_at].freeze

  attr_accessor(*QUERY_ATTRIBUTES)
  attr_reader :errors

  def initialize
    @errors = []
  end

  def persisted?
    !id.nil?
  end

  def printable_gender
    GENDERS.invert[@gender]
  end

  def gender=(new_gender)
    @gender = new_gender.to_i
  end

  def age=(value)
    @age = value.to_i
  end
end
