class Raid < ApplicationRecord
  RAID_DURATION = 44
  RAID_BOSSES = {
    5 => ["Regirock"],
    4 => ["Tyranitar", "Marowak", "Absol", "Rhydon", "Ursaring"],
    3 => ["Machamp", "Raichu", "Tangela", "Donphan", "Pilowsine"],
    2 => ["Kirila", "Exeggutor", "Mawile", "Pineco", "Roselia"],
    1 => ["Magikarp", "Chikorita", "Cyndaquil", "Totodile", "Sunkern", "Yanma"],
  }

  belongs_to :gym
  has_and_belongs_to_many :attendees, class_name: "User"

  validates :boss, presence: true
  validates :time, presence: true
  validates_numericality_of :level
  validates_inclusion_of :level, in: 1..5

  def scheduled_time
    return unless time
    time.strftime("%H:%M")
  end

  def confirmed
    attendees.count
  end

  def ends_at
    return unless time
    duration = remaining_time || RAID_DURATION
    ending_time = time + duration.minutes
    ending_time.strftime("%H:%M")
  end

  def add_attendee(user)
    attendees << user unless already_registered?(user)
  end

  def already_registered?(user)
    attendees.where(id: user.id).exists?
  end

  def set_level
    return unless boss
    self.level = find_level(boss)
  end

  private

    def find_level(boss)
      RAID_BOSSES.each do |key, bosses|
        return key if bosses.include?(boss)
      end
    end
end
