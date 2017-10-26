class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: 'No blank passwords'}
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    if user
      if BCrypt::Password.new(user.password_digest).is_password?(password)
        return user
      end
    end
    nil
  end

  def self.generate_session_token
    return SecureRandom::urlsafe_base64
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(argument)
    @password = argument
    self.password_digest = BCrypt::Password.create(password)
  end
end
