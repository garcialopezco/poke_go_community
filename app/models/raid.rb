class Raid < ApplicationRecord
  belongs_to :gym

  validates :boss, presence: true
  validates :time, presence: true
end
