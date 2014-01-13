require 'spec_helper'

describe "sms_notifications/show" do
  before(:each) do
    @sms_notification = assign(:sms_notification, stub_model(SmsNotification,
      :receiver_user_id => "Receiver User",
      :integer => "Integer",
      :sms_message => "Sms Message",
      :text => "Text",
      :receiver_phone_no => "Receiver Phone No",
      :string => "String",
      :event_type => "Event Type",
      :string => "String",
      :sent_at => "Sent At",
      :datetime => "Datetime",
      :status => "Status",
      :string => "String",
      :error_reason => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Receiver User/)
    rendered.should match(/Integer/)
    rendered.should match(/Sms Message/)
    rendered.should match(/Text/)
    rendered.should match(/Receiver Phone No/)
    rendered.should match(/String/)
    rendered.should match(/Event Type/)
    rendered.should match(/String/)
    rendered.should match(/Sent At/)
    rendered.should match(/Datetime/)
    rendered.should match(/Status/)
    rendered.should match(/String/)
    rendered.should match(/MyText/)
  end
end
