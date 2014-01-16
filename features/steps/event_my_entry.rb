class Spinach::Features::EventMyEntry < Spinach::FeatureSteps
  include CommonHelpers

  step 'Followee가 있다' do
    @user = get_test_user
    @followers_with_noti = Array.new
    @followers_without_noti = Array.new 
  end

  step 'Follower중 몇 명의 새글이 있다' do # message flags에서 몇몇 message들을 삭제
    # 새로운 글이 있는 내가 following하는 사용자 생성
    for i in 10..13
      follower = create_related_user @user.id, false, "#{i}", true
      @followers_with_noti << follower
      follower.messages.create(:message => follower.id.to_s + "_message_" + i.to_s)
      if i == 13
        follower.messages.create(:message => follower.id.to_s + "_message_" + i.to_s)
      end
    end
  end

  step 'Follower중 몇 명은 새글이 없다' do 
    # 새로운 글이 없는 내가 following하는 사용자 생성
    for i in 20..21
      follower = create_related_user @user.id, false, "#{i}", true
      @followers_without_noti << follower
    end
  end

  step 'Followee가 존에 진입' do
    xml = '<?xml version="1.0" encoding="UTF-8"?><BODY><IMSI>'+@user.imsi+'</IMSI><EVENT>IN</EVENT></BODY>'
   
    url = URI.parse('http://localhost:3000/events')
    request = Net::HTTP::Post.new(url.path)
    request.content_type = 'application/xml'
    request.body = xml
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
  end

  step '새글이 있는 Follower들의 알림 메시지가 전송된다' do # sms notification에서 해당 사용자의 follower메시지만 보인다
    SmsNotification.all.count.should == @followers_with_noti.count
  end
end
