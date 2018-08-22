class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :level, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
