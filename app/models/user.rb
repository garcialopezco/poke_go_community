class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :level, presence: true
  validates_numericality_of :level
  validates_inclusion_of :level, in: 5..40
  validates :team, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
