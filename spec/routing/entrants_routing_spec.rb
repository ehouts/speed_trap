require "spec_helper"

describe EntrantsController do
  describe "routing" do

    it "routes to #index" do
      get("/entrants").should route_to("entrants#index")
    end

    it "routes to #new" do
      get("/entrants/new").should route_to("entrants#new")
    end

    it "routes to #show" do
      get("/entrants/1").should route_to("entrants#show", :id => "1")
    end

    it "routes to #edit" do
      get("/entrants/1/edit").should route_to("entrants#edit", :id => "1")
    end

    it "routes to #create" do
      post("/entrants").should route_to("entrants#create")
    end

    it "routes to #update" do
      put("/entrants/1").should route_to("entrants#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/entrants/1").should route_to("entrants#destroy", :id => "1")
    end

  end
end
