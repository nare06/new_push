require "spec_helper"

describe CampusesController do
  describe "routing" do

    it "routes to #index" do
      get("/campuses").should route_to("campuses#index")
    end

    it "routes to #new" do
      get("/campuses/new").should route_to("campuses#new")
    end

    it "routes to #show" do
      get("/campuses/1").should route_to("campuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/campuses/1/edit").should route_to("campuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/campuses").should route_to("campuses#create")
    end

    it "routes to #update" do
      put("/campuses/1").should route_to("campuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/campuses/1").should route_to("campuses#destroy", :id => "1")
    end

  end
end
