require 'rails_helper'

RSpec.describe RaidsController, type: :controller do
  let(:user) {
    FactoryBot.create(:user,
                      name: "Chaaartz",
                      level: 40,
                      trainer_phone_number: "9511234567",
                      password: "MyP@ssword1",
                      password_confirmation: "MyP@ssword1")
  }

  let(:gym) {
    FactoryBot.create(:gym,
                      name: "Some Gym Name",
                      lat: "1.2345",
                      long: "0.7584",
                      description: "Test Gym")
  }

  let(:valid_attributes) {
    {
      gym_id: gym.id,
      boss: "Machamp",
      hour: 11,
      minute: 35
    }
  }

  let(:valid_model_attributes) {
    {
      gym_id: gym.id,
      boss: "Machamp",
      time: Time.current
    }
  }

  let(:invalid_attributes) {
    {
      gym_id: gym.id,
      boss: nil,
      hour: 11,
      minute: 35
    }
  }

  let(:valid_session) { { user_id: user.id } }

  describe "GET #index" do
    it "returns a success response" do
      Raid.create! valid_model_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      raid = Raid.create! valid_model_attributes
      get :show, params: { id: raid.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      raid = Raid.create! valid_model_attributes
      get :edit, params: { id: raid.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Raid" do
        expect {
          post :create, params: { raid: valid_attributes }, session: valid_session
        }.to change(Raid, :count).by(1)
      end

      it "redirects to the created raid" do
        post :create, params: { raid: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Raid.last)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: { raid: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          gym_id: gym.id,
          boss: "Machamp",
          hour: 16,
          minute: 35
        }
      }

      it "updates the requested raid" do
        raid = Raid.create! valid_model_attributes
        put :update, params: { id: raid.to_param, raid: new_attributes }, session: valid_session
        raid.reload

        expect(raid.time.hour).to eq new_attributes[:hour]
      end

      it "redirects to the raid" do
        raid = Raid.create! valid_model_attributes
        put :update, params: { id: raid.to_param, raid: valid_attributes }, session: valid_session
        expect(response).to redirect_to(raid)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        raid = Raid.create! valid_model_attributes
        put :update, params: { id: raid.to_param, raid: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested raid" do
      raid = Raid.create! valid_model_attributes
      expect {
        delete :destroy, params: {id: raid.to_param}, session: valid_session
      }.to change(Raid, :count).by(-1)
    end

    it "redirects to the raids list" do
      raid = Raid.create! valid_model_attributes
      delete :destroy, params: {id: raid.to_param}, session: valid_session
      expect(response).to redirect_to(raids_url)
    end
  end

end
