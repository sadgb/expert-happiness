class ValidateUserService

  # @param [User] user
  def self.call(user)

    unless User::GENDERS.values.include?(user.gender)
      user.errors << 'Invalid gender'
    end

    email = user.email
    if email.blank? || (email =~ URI::MailTo::EMAIL_REGEXP).nil?
      user.errors << 'Email is invalid'
    end

    city = user.city
    if !city.blank? && city.length > 50
      user.errors << 'City name is too long'
    end

    about = user.about
    if !about.blank? && about.length > 150
      user.errors << 'About is too long'
    end

    name = user.name
    if name.blank? || name.length < 3 || name.length > 50
      user.errors << 'Name length should be between 3 and 50'
    end

    surname = user.surname
    if surname.blank? || surname.length < 3 || surname.length > 50
      user.errors << 'Surname length should be between 3 and 50'
    end

    age = user.age
    if age.blank? || age < 18 || age > 200
      user.errors << 'You should be at least 18 years old to continue. But not very old'
    end

    user
  end
end