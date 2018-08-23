require 'rails_helper'

RSpec.describe Raid, type: :model do
  it { is_expected.to belong_to :gym }
  it { is_expected.to validate_presence_of :boss }
  it { is_expected.to validate_presence_of :time }
end
