require 'rails_helper'

RSpec.describe Raid, type: :model do
  it { is_expected.to belong_to :gym }
  it { is_expected.to validate_presence_of :boss }
  it { is_expected.to validate_presence_of :time }
  it { is_expected.to validate_numericality_of :level }
  it { is_expected.to validate_inclusion_of(:level).in_range(1..5) }

  describe "#scheduled_time" do
    it "formats raid time to just hour and minutes HH:mm" do
      raid = Raid.new(time: Time.current.change(hour: 12, min: 25))
      expect(raid.scheduled_time).to eq "12:25"
    end
  end # describe scheduled_time

  describe "#ends_at" do
    context "when no remaining time is provided" do
      it "sets the ending time to starting time plus 44 minutes" do
        raid = Raid.new(time: Time.current.change(hour: 12, min: 25))
        expect(raid.ends_at).to eq "13:09"
      end
    end # context when no remaining time is provided

    context "when remaining time is provided" do
      it "sets the endin time to starting time plus the number of minutes of the remaining time" do
        raid = Raid.new(time: Time.current.change(hour: 12, min: 25), remaining_time: 5)
        expect(raid.ends_at).to eq "12:30"
      end
    end # context when remaining time is provided
  end # describe ends_at

  describe "#confirmed" do
    let(:gym) { FactoryBot.create :gym }
    let(:raid) { FactoryBot.create :raid, gym: gym }

    context "when no users have confirmed their attedance" do
      it "returns 0" do
        expect(raid.confirmed).to eq 0
      end
    end # context when no users have confirmed their attedance

    context "when several users have confirmed their attendance" do
      let(:some_user) { FactoryBot.create :user }
      let(:other_user) { FactoryBot.create :user }

      it "returns the number of confirmed attendees" do
        raid.attendees << some_user
        raid.attendees << other_user

        expect(raid.confirmed).to eq 2
      end
    end # context when several users have confirmed their attendance
  end # describe confirmed

  describe "#add_attendee" do
    let(:gym) { FactoryBot.create :gym }
    let(:raid) { FactoryBot.create :raid, gym: gym }
    let(:some_user) { FactoryBot.create :user }

    it "adds a new attendee to the raid" do
      expect {
        raid.add_attendee(some_user)
      }.to change { raid.confirmed }.by(1)
    end

    it "adds the attendee only once" do
      expect {
        raid.add_attendee(some_user)
        raid.add_attendee(some_user)
      }.to change { raid.confirmed }.by(1)
    end
  end # describe add_attendee
end
