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
      @messages << (follower.messages.create(:message => follower.id.to_s + "김형준 에디터 = 부상으로 2월까지 경기에 나서지 못할 거라던 세르히오 아구에로가 블랙번과의 FA컵 경기를 통해 복귀했다.

맨체스터 시티(이하 맨시티)가 블랙번 로버스와의 FA컵 재경기서 알바로 네그레도, 에딘 제코, 세르히오 아구에로의 골에 힘입어 5-0 대승을 거뒀다" + i.to_s)).message
    end
    # 친구 - Cafe
    for i in 21..22
      follower = create_related_user @user.id, true, "#{i}", true
      @messages << (follower.messages.create(:message => follower.id.to_s + "김형준 에디터 = 부상으로 2월까지 경기에 나서지 못할 거라던 세르히오 아구에로가 블랙번과의 FA컵 경기를 통해 복귀했다.

맨체스터 시티(이하 맨시티)가 블랙번 로버스와의 FA컵 재경기서 알바로 네그레도, 에딘 제코, 세르히오 아구에로의 골에 힘입어 5-0 대승을 거뒀다" + i.to_s)).message
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
