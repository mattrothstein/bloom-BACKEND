require "rails_helper"

RSpec.describe InjectorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/injectors").to route_to("injectors#index")
    end

    it "routes to #new" do
      expect(:get => "/injectors/new").to route_to("injectors#new")
    end

    it "routes to #show" do
      expect(:get => "/injectors/1").to route_to("injectors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/injectors/1/edit").to route_to("injectors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/injectors").to route_to("injectors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/injectors/1").to route_to("injectors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/injectors/1").to route_to("injectors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/injectors/1").to route_to("injectors#destroy", :id => "1")
    end

  end
end
