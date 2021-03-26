class UserSignInService

  def self.call(name, surname, gender, age, password)
    user = User.new
    user.name = name
    user.surname = surname
    user.gender = gender
    user.age = age

    user.errors << 'Password shouldnt be blank' if password.blank?
    user.password_hash = HashPasswordService.call(password)

    ValidateUserService.call(user)

    if user.errors.blank?
      Database::Users::Insert.call(user)
    end

    user
  end
end