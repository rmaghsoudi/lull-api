class User < ApplicationRecord
  # Recoverable to recover/change passwords
  # JWT utilized for rails API as devise was intended for full rails apps
  devise :database_authenticatable, :recoverable,
        :jwt_authenticatable
        jwt_revocation_strategy: JWTBlacklist
end
