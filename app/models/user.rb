class User < ApplicationRecord
  # Recoverable to recover/change passwords
  # JWT utilized for rails API as devise was intended for full rails apps
  devise :database_authenticatable, :recoverable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist

  # Validations
  validates :email, uniqueness: true
  validates :password, format: { 
    with: /\A.*(?=.{6,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]]).*\z/,
    message: 'Invalid password. Must have at least 6 characters, 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character'
  }
  # Relationships
  has_many :entries
  has_many :tests
  has_many :goals
  has_many :exercises

end