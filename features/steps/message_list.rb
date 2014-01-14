class Spinach::Features::MessageList < Spinach::FeatureSteps
  include CommonHelpers

  step '가입자' do
    user_destroy_all
    @user = get_test_user
    Message.destroy_all
  end

  step 'Follower들이 남긴 글이 있다' do
    @messages = Array.new

    # 친구 - 일반인 
    for i in 10..20
      follower = create_related_user @user.id, false, "#{i}", true
      @messages << (follower.messages.create(:message => follower.id.to_s + "_message_" + i.to_s)).message
    end
    # 친구 - Cafe
    for i in 21..22
      follower = create_related_user @user.id, true, "#{i}", true
      @messages << (follower.messages.create(:message => follower.id.to_s + "_message_" + i.to_s)).message
    end

  end

  step '메시지 페이지 접속' do
    #visit(messages_path)
  end

  step 'Follower들의 남긴 글이 보인다' do
    # within("#content_messages") do
    #   all('.well > p').each do |msg|
    #     @messages.include?(msg.text).should == true
    #   end
    # end
  end
end
