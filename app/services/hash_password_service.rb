class HashPasswordService
  def self.call(password)
    BCrypt::Password.create(password)
  end
end