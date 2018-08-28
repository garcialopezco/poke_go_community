require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :level }
  it { is_expected.to validate_numericality_of :level }
  it { is_expected.to validate_inclusion_of(:level).in_range(5..40) }
  it { is_expected.to validate_presence_of :team }
  it { is_expected.to validate_presence_of :password }
  it { is_expected.to validate_presence_of :password_confirmation }
  it { is_expected.to validate_uniqueness_of :name }
end
