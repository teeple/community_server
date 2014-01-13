require 'spec_helper'

describe "sms_notifications/show" do
  before(:each) do
    @sms_notification = assign(:sms_notification, stub_model(SmsNotification,
      :receiver_user_id => 1,
      :sms_message => "MyText",
      :receiver_phone_no => "Receiver Phone No",
      :event_type => "Event Type",
      :status => "Status",
      :error_reason => "Error Reason"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/Receiver Phone No/)
    rendered.should match(/Event Type/)
    rendered.should match(/Status/)
    rendered.should match(/Error Reason/)
  end
end
