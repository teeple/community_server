require "spec_helper"

describe SmsNotificationsController do
  describe "routing" do

    it "routes to #index" do
      get("/sms_notifications").should route_to("sms_notifications#index")
    end

    it "routes to #new" do
      get("/sms_notifications/new").should route_to("sms_notifications#new")
    end

    it "routes to #show" do
      get("/sms_notifications/1").should route_to("sms_notifications#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sms_notifications/1/edit").should route_to("sms_notifications#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sms_notifications").should route_to("sms_notifications#create")
    end

    it "routes to #update" do
      put("/sms_notifications/1").should route_to("sms_notifications#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sms_notifications/1").should route_to("sms_notifications#destroy", :id => "1")
    end

  end
end
