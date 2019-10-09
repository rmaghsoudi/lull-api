class User < ApplicationRecord
  # Recoverable to recover/change passwords
  # JWT utilized for rails API as devise was intended for full rails apps
  devise :database_authenticatable, :recoverable, :registerable,
        :jwt_authenticatable, jwt_revocation_strategy: JWTBlacklist

  # Validations
  validates :email, uniqueness: true

  # Relationships
  has_many :entries
  has_many :tests
  has_many :goals
  has_many :exercises

end
