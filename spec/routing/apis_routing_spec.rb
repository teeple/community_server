require "spec_helper"

describe ApisController do
  describe "routing" do

    it "routes to #index" do
      get("/apis").should route_to("apis#index")
    end

    it "routes to #new" do
      get("/apis/new").should route_to("apis#new")
    end

    it "routes to #show" do
      get("/apis/1").should route_to("apis#show", :id => "1")
    end

    it "routes to #edit" do
      get("/apis/1/edit").should route_to("apis#edit", :id => "1")
    end

    it "routes to #create" do
      post("/apis").should route_to("apis#create")
    end

    it "routes to #update" do
      put("/apis/1").should route_to("apis#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/apis/1").should route_to("apis#destroy", :id => "1")
    end

  end
end
