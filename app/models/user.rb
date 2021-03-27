# frozen_string_literal: true

class User
  GENDERS = {
    male: 1,
    female: 2,
    other: 3
  }.freeze

  QUERY_ATTRIBUTES = [:id, :name, :surname, :email, :gender, :age, :password_hash ]

  attr_accessor :id, :name, :surname, :password_hash, :email
  attr_reader :errors, :gender, :age

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
