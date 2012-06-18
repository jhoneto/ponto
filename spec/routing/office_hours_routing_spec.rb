require "spec_helper"

describe OfficeHoursController do
  describe "routing" do

    it "routes to #index" do
      get("/office_hours").should route_to("office_hours#index")
    end

    it "routes to #new" do
      get("/office_hours/new").should route_to("office_hours#new")
    end

    it "routes to #show" do
      get("/office_hours/1").should route_to("office_hours#show", :id => "1")
    end

    it "routes to #edit" do
      get("/office_hours/1/edit").should route_to("office_hours#edit", :id => "1")
    end

    it "routes to #create" do
      post("/office_hours").should route_to("office_hours#create")
    end

    it "routes to #update" do
      put("/office_hours/1").should route_to("office_hours#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/office_hours/1").should route_to("office_hours#destroy", :id => "1")
    end

  end
end
