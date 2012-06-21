require "spec_helper"

describe EnterprisesController do
  describe "routing" do

    it "routes to #index" do
      get("/enterprises").should route_to("enterprises#index")
    end

    it "routes to #new" do
      get("/enterprises/new").should route_to("enterprises#new")
    end

    it "routes to #show" do
      get("/enterprises/1").should route_to("enterprises#show", :id => "1")
    end

    it "routes to #edit" do
      get("/enterprises/1/edit").should route_to("enterprises#edit", :id => "1")
    end

    it "routes to #create" do
      post("/enterprises").should route_to("enterprises#create")
    end

    it "routes to #update" do
      put("/enterprises/1").should route_to("enterprises#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/enterprises/1").should route_to("enterprises#destroy", :id => "1")
    end

  end
end
