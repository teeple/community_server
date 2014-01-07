class Spinach::Features::UserList < Spinach::FeatureSteps
  include CommonHelpers
  step '가입자' do
    user_destroy_all
    @user = get_test_user
  end
  step 'Follower 가 여러 명 있다' do
    @followers = Hash.new
    for i in 10..20
      follower = create_related_user @user.id, false, "#{i}", true
      @followers[('user_id_' + follower.id.to_s).to_sym] =  true
    end
    for i in 21..22
      follower = create_related_user @user.id, true, "#{i}", true
      @followers[('user_id_' + follower.id.to_s).to_sym] =  true
    end
  end

  step 'Not Follower 가 여러 명 있다' do
    @not_followers = Hash.new
    for i in 30..40
      not_follower = create_related_user @user.id, false, "#{i}", false
      @not_followers[('user_id_' + not_follower.id.to_s).to_sym] =  true
    end
  end

  step 'Cafe 가 여러 명 있다' do
    @cafes = Hash.new
    for i in 41..50
      cafe = create_related_user @user.id, true, "#{i}", false
      @cafes[('user_id_' + cafe.id.to_s).to_sym] =  true
    end
  end

  step 'User 페이지 접속' do
    visit(users_path)
  end

  step 'Follower 리스트가 보인다' do
    within("#content_users") do
      all('em').each do |em| 
        @followers.has_key?(em.value.to_sym).should == true
      end
    end
  end

  step 'Not Follower 탭 클릭' do
    click_link("Not Followers")
  end

  step 'Not Follower 리스트가 보인다' do
    within("#content_users") do
      all('em').each do |em| 
        @not_followers.has_key?(em.value.to_sym).should == true
      end
    end
  end

  step 'Cafe 탭 클릭' do
    click_link("Cafes")
  end

  step 'Cafe 리스트가 보인다' do
    within("#content_users") do
      all('em').each do |em| 
        @cafes.has_key?(em.value.to_sym).should == true
      end
    end

  end
end
