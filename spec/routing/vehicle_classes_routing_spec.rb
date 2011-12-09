require "spec_helper"

describe VehicleClassesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_classes").should route_to("vehicle_classes#index")
    end

    it "routes to #new" do
      get("/vehicle_classes/new").should route_to("vehicle_classes#new")
    end

    it "routes to #show" do
      get("/vehicle_classes/1").should route_to("vehicle_classes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_classes/1/edit").should route_to("vehicle_classes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_classes").should route_to("vehicle_classes#create")
    end

    it "routes to #update" do
      put("/vehicle_classes/1").should route_to("vehicle_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_classes/1").should route_to("vehicle_classes#destroy", :id => "1")
    end

  end
end
