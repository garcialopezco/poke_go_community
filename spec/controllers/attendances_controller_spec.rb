require "rails_helper"

RSpec.describe AttendancesController, type: :controller do
  let(:gym) { FactoryBot.create :gym }
  let(:raid) { FactoryBot.create :raid, gym: gym }
  let(:user) { FactoryBot.create :user }

  let(:valid_session) { { user_id: user.id } }

  describe "POST create" do
    it "increments the attendees list to a raid" do
      expect {
        post :create, params: { raid_id: raid.id }, session: valid_session 
      }.to change { raid.confirmed }.by(1)
    end
  end # describe POST create
end # describe
