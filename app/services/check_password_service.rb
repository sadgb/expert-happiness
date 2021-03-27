class CheckPasswordService
  def self.call(password_hash, cleartext_password)
    BCrypt::Password.new(password_hash) == cleartext_password
  rescue
    false
  end
end