class Spinach::Features::SignUp < Spinach::FeatureSteps
  include CommonHelpers

  step '비가입자' do
    user_not_registered
  end

  step '가입페이지 접속' do
    visit(new_user_path)
  end

  step '전화번호 미입력' do
     fill_in('user_phone_no',{:with => ''})
  end

  step '"회원가입" 클릭' do
    click_button('회원가입');
  end

  step '가입페이지에서 머무름' do
    current_path.should == users_path
  end

  step '"전화번호를 입력하세요" 출력' do
    page.should have_content('전화번호를 입력하세요')
  end

  step '아이디 미입력' do
    fill_in('user_user_name',{:with => ''})
  end

  step '"아이디를 입력하세요" 출력' do
    page.should have_content('아이디를 입력하세요')
  end

  step '형식에 맞지 않는 전화번호 입력' do
    fill_in('user_imsi',{:with => '33'})
    fill_in('user_ecgi',{:with => '44'})
    fill_in('user_user_name',{:with => 'user2'})
    fill_in('user_phone_no',{:with => '0101111aaaa'})
  end

  step '"형식에 맞지 않는 전화번호 입니다" 출력' do
    page.should have_content('형식에 맞지 않는 전화번호 입니다')
  end

  step '형식에 맞지 않는 아이디 입력' do
    pending 'step not implemented'
  end

  step '"형식에 맞지 않는 아이디 입니다" 출력' do
    pending 'step not implemented'
  end

  step '가입자' do
    pending 'step not implemented'
  end

  step '중복된 전화번호 입력' do
    pending 'step not implemented'
  end

  step '"중복된 전화번호 입니다" 출력' do
    pending 'step not implemented'
  end

  step '중복된 아이디 입력' do
    pending 'step not implemented'
  end

  step '"중복된 아이디 입니다" 출력' do
    pending 'step not implemented'
  end

  step '아이디, 전화번호 입력' do
    pending 'step not implemented'
  end

  step '사용자 설정 페이지로 이동' do
    pending 'step not implemented'
  end

  step '"가입을 축하합니다" 출력' do
    pending 'step not implemented'
  end
end
