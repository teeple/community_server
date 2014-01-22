class Spinach::Features::Setting < Spinach::FeatureSteps
  include CommonHelpers
 
  step '가입자' do
    @user = get_test_user
  end

  step 'Setting 페이지 접속' do
    visit(setting_path)
  end

  step 'Submit 클릭' do
    click_button("Save")
  end

  step '프로필 수정이 완료되었습니다 출력' do
    page.should have_content('프로필 수정이 완료되었습니다')
  end
end
