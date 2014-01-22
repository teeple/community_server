class Spinach::Features::SignUp < Spinach::FeatureSteps
  include CommonHelpers

  step '모든 가입자 삭제' do
    user_destroy_all
  end

  step '비가입자' do
    user_not_registered
  end

  step '가입페이지 접속' do
    visit(new_user_path)
  end

  step '전화번호 미입력' do
     fill_in('user_phone_no',{:with => ''})
  end

  step '회원가입 클릭' do
    click_button('회원 가입');
  end

  step '가입페이지에서 머무름' do
    current_path.should == users_path
  end

  step '전화번호를 입력하세요 출력' do
    page.should have_content('전화번호를 입력하세요')
  end

  step '아이디 미입력' do
    fill_in('user_user_name',{:with => ''})
  end

  step '아이디를 입력하세요 출력' do
    page.should have_content('아이디를 입력하세요')
  end

  step '형식에 맞지 않는 전화번호 입력' do
    fill_in('user_user_name',{:with => 'user2'})
    fill_in('user_phone_no',{:with => '0101111aaaa'})
  end

  step '형식에 맞지 않는 전화번호 입니다 출력' do
    page.should have_content('형식에 맞지 않는 전화번호 입니다')
  end

  step '형식에 맞지 않는 아이디 입력' do
    # 영문, 숫자, ‘.’, ‘_’,’-’ 만 사용 가능. 검색 시 이용됨 (최대길이 15자)
    fill_in('user_user_name',{:with => 'user2@'})
    fill_in('user_phone_no',{:with => '01011112222'})
  end

  step '형식에 맞지 않는 아이디 입니다 출력' do
    page.should have_content('형식에 맞지 않는 아이디 입니다')
  end

  step '가입자' do
    @user = get_test_user
  end

  step '중복된 전화번호 입력' do
    fill_in('user_user_name',{:with => 'user3'})
    fill_in('user_phone_no',{:with => @user.phone_no})
  end

  step '중복된 전화번호 입니다 출력' do
    page.should have_content('중복된 전화번호 입니다')
  end

  step '중복된 아이디 입력' do
    fill_in('user_user_name',{:with => @user.user_name})
    fill_in('user_phone_no',{:with => '01011112223'})
  end

  step '중복된 아이디 입니다 출력' do
    page.should have_content('중복된 아이디 입니다')
  end

  step '아이디, 전화번호 입력' do
    fill_in('user_user_name',{:with => 'user4'})
    fill_in('user_phone_no',{:with => '01011112224'})
  end

  step '사용자 설정 페이지로 이동' do
    current_path.should_not == users_path
  end

  step '가입을 축하합니다 출력' do
    page.should have_content('가입을 축하합니다')
  end
end
