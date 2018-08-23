require "rails_helper"

RSpec.describe RaidsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/raids").to route_to("raids#index")
    end

    it "routes to #new" do
      expect(:get => "/raids/new").to route_to("raids#new")
    end

    it "routes to #show" do
      expect(:get => "/raids/1").to route_to("raids#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/raids/1/edit").to route_to("raids#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/raids").to route_to("raids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/raids/1").to route_to("raids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/raids/1").to route_to("raids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/raids/1").to route_to("raids#destroy", :id => "1")
    end
  end
end
