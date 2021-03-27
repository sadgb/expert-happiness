class UserSignUpService

  def self.call(email, name, surname, gender, age, city, about, password)
    user = User.new
    user.name = name
    user.email = email
    user.surname = surname
    user.gender = gender
    user.age = age
    user.city = city
    user.about = about

    user.errors << 'Password shouldnt be blank' if password.blank?
    user.password_hash = HashPasswordService.call(password)

    ValidateUserService.call(user)

    if user.errors.blank?
      Database::Users::Insert.call(user)
    end

    user
  end
end