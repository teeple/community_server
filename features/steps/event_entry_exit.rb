class Spinach::Features::EventEntryExit < Spinach::FeatureSteps
  include CommonHelpers
  
  step 'Followee가 있다' do
    @user = get_test_user
  end

  step 'Follower가 여러명 있다' do
    # 나를 following하는 사용자 (일반 사용자) 생성
    @my_followers_with_noti = Array.new
    for i in 11..12
      @my_followers_with_noti.push(create_my_follower @user, false, "#{i}", @user.ecgi, true, true, true) #post,entry,exit
    end 
    for i in 13..15
      create_my_follower @user, false, "#{i}", @user.ecgi, false, false, false
    end 
  end

  step 'Followee가 존에 진입' do
    xml = '<?xml version="1.0" encoding="UTF-8"?><BODY><IMSI>'+@user.imsi+'</IMSI><EVENT>IN</EVENT></BODY>'
   
    url = URI.parse('http://localhost:3000/events')
    request = Net::HTTP::Post.new(url.path)
    request.content_type = 'application/xml'
    request.body = xml
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

    #Note this test PASSES!
    #assert_equal '201 Created', response.get_fields('Status')[0]
  end


  step 'Followee들에게 진입알림 메시지가 전송된다' do
    SmsNotification.all.count.should == @my_followers_with_noti.count
  end

  step 'Followee가 존에서 이탈' do
    xml = '<?xml version="1.0" encoding="UTF-8"?><BODY><IMSI>'+@user.imsi+'</IMSI><EVENT>OUT</EVENT></BODY>'
   
    url = URI.parse('http://localhost:3000/events')
    request = Net::HTTP::Post.new(url.path)
    request.content_type = 'application/xml'
    request.body = xml
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
  end

  step 'Followee들에게 이탈알림 메시지가 전송된다' do
    SmsNotification.all.count.should == @my_followers_with_noti.count
  end
end
