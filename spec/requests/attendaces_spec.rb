require "rails_helper"

RSpec.describe "Attendances", type: :request do
  describe "as non logged user" do
    it "denies perform the action" do
      post raid_attendances_path(1)
      expect(response).to redirect_to login_path
    end
  end
end
