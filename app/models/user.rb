class User < ApplicationRecord

  has_many :guestlists
  has_many :events, through: :guestlists
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :password, presence: true
  validates :email, length: {minimum: 7, maximum:50}
  validates :password, length: {minimum: 5, maximum:20}
  validates :profile, length: {minimum: 25, maximum: 250}
  has_secure_password
# def authenticate(plaintext_password)
#   BCrypt::Password.new(self.password_digest) == plaintext_password
# end
#
# def password=(plaintext_password)
#   self.password_digest = BCrypt::Password.create(plaintext_password)
# end

end
