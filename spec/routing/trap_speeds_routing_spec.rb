require "spec_helper"

describe TrapSpeedsController do
  describe "routing" do

    it "routes to #index" do
      get("/trap_speeds").should route_to("trap_speeds#index")
    end

    it "routes to #new" do
      get("/trap_speeds/new").should route_to("trap_speeds#new")
    end

    it "routes to #show" do
      get("/trap_speeds/1").should route_to("trap_speeds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trap_speeds/1/edit").should route_to("trap_speeds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trap_speeds").should route_to("trap_speeds#create")
    end

    it "routes to #update" do
      put("/trap_speeds/1").should route_to("trap_speeds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trap_speeds/1").should route_to("trap_speeds#destroy", :id => "1")
    end

  end
end
