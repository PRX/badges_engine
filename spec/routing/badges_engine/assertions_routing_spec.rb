require "spec_helper"

describe BadgesEngine::AssertionsController do
  describe "routing" do
    
    before do
      BadgesEngine::Engine.load_engine_routes('badges')
    end

    it "routes to #bake_callback" do
      get("/badges/a/1/THISISAKEY.json").should route_to("badges_engine/assertions#bake_callback", 
                                                          :id=>"1", :token=>'THISISAKEY', :format=>'json')
    end

    it "routes to #index" do
      get("/badges/assertions").should route_to("badges_engine/assertions#index")
    end

    it "routes to #new" do
      get("/badges/assertions/new").should route_to("badges_engine/assertions#new")
    end

    it "routes to #show" do
      get("/badges/assertions/1").should route_to("badges_engine/assertions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/badges/assertions/1/edit").should route_to("badges_engine/assertions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/badges/assertions").should route_to("badges_engine/assertions#create")
    end

    it "routes to #update" do
      put("/badges/assertions/1").should route_to("badges_engine/assertions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/badges/assertions/1").should route_to("badges_engine/assertions#destroy", :id => "1")
    end

  end
end
