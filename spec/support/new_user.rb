# frozen_string_literal: true

def new_user
  u = User.new
  u.age = (19..100).to_a.sample
  u.name = "#{SecureRandom.hex}fooo"
  u.surname = "#{SecureRandom.hex}bar"
  u.email = "#{SecureRandom.hex}@test"
  u.city = "#{SecureRandom.hex}test city"
  u.about = "#{SecureRandom.hex}test about"
  u.gender = User::GENDERS.values.sample

  Database::Users::Insert.call(u)

  u
end
