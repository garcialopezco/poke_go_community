require 'rails_helper'

RSpec.describe "Raids", type: :request do
  describe "as non logged user" do
    it "denies access to /raids" do
      get raids_path
      expect(response).to redirect_to login_path
    end

    it "denies access to create new raids" do
      get new_raid_path
      expect(response).to redirect_to login_path

      post raids_path, params: { raid: {} }
      expect(response).to redirect_to login_path
    end

    it "denies access to edit a raid" do
      gym = FactoryBot.create :gym
      raid = FactoryBot.create :raid, gym: gym
      get raid_path(raid)
      expect(response).to redirect_to login_path

      get raid_path(raid), params: { raid: {} }
      expect(response).to redirect_to login_path
    end

    it "denies access to delete a raid" do
      gym = FactoryBot.create :gym
      raid = FactoryBot.create :raid, gym: gym
      delete raid_path(raid)
      expect(response).to redirect_to login_path
    end
  end
end
