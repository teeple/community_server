class Spinach::Features::MessagePost < Spinach::FeatureSteps
  include CommonHelpers
  step '가입자' do
    user_destroy_all
    @user = get_test_user

    # sms_notification 정보 삭제
    SmsNotification.destroy_all
    Event.destroy_all
  end

  step '가입자가 Following하는 사용자' do
    @followers = Hash.new

    for i in 10..20
      follower = create_related_user @user.id, false, "#{i}", true
      @followers[('user_id_' + follower.id.to_s).to_sym] =  true
    end
    for i in 21..22
      follower = create_related_user @user.id, true, "#{i}", true
    end
  end

  step '새 글 등록 페이지 접속' do
    visit(new_message_path)
  end

  step '새 글 등록' do
    fill_in("message_message",:with => "test message")
    click_button("Post")
  end

  step '새 글이 등록되었습니다 메시지 확인' do
    page.should have_content('새 글이 등록되었습니다')
  end

  step '친구로 접속' do
    pending 'step not implemented'
  end

  step '새 글이 등록되었음을 확인' do 
    pending 'step not implemented'
  end

  # New 표시가 제대로 보임을 확인한다
  step '글이 새글 표시가 되어 있음을 확인' do
    pending 'step not implemented'
  end

  step '가입자를 Following하는 같은 존에 있는 사용자' do
    @my_followers_same_zone = Hash.new
    # 나를 following하는 사용자 (일반 사용자) 생성
    for i in 11..20
      my_follower = create_my_follower @user, false, "#{i}", @user.ecgi, true, true, true
      @my_followers_same_zone[my_follower.id.to_s.to_sym] = true

      # user와 동일한 존에 있도록 API서버에 해당 사용자 생성
      create_user_in_api(my_follower.imsi, @user.ecgi)
    end 
  end

  step '가입자를 Following하는 같은 존에 없는 사용자' do
    @my_followers_not_same_zone = Hash.new
    # 나를 following하는 사용자 (일반 사용자) 생성
    for i in 21..30
      my_follower = create_my_follower @user, false, "#{i}", @user.ecgi, true, true, true
      @my_followers_not_same_zone[my_follower.id.to_s.to_sym] = true

      # user와 동일한 존에 있도록 API서버에 해당 사용자 생성
      not_my_ecgi = @user.ecgi + 10.to_s
      create_user_in_api(my_follower.imsi, not_my_ecgi)
    end
  end

  step '같은 존에 있는 Follower만 메시지 수신' do
    SmsNotification.all.count.should == @my_followers_same_zone.count
  end
end
