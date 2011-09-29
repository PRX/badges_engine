require "spec_helper"

describe BadgesEngine::BadgesController do
  describe "routing" do

    before do
      BadgesEngine::Engine.load_engine_routes
    end

    it "routes to #index" do
      get("/badges/badges").should route_to("badges_engine/badges#index")
    end

    it "routes to #new" do
      get("/badges/badges/new").should route_to("badges_engine/badges#new")
    end

    it "routes to #show" do
      get("/badges/badges/1").should route_to("badges_engine/badges#show", :id => "1")
    end

    it "routes to #edit" do
      get("/badges/badges/1/edit").should route_to("badges_engine/badges#edit", :id => "1")
    end

    it "routes to #create" do
      post("/badges/badges").should route_to("badges_engine/badges#create")
    end

    it "routes to #update" do
      put("/badges/badges/1").should route_to("badges_engine/badges#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/badges/badges/1").should route_to("badges_engine/badges#destroy", :id => "1")
    end

  end
end
