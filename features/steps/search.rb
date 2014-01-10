class Spinach::Features::Search < Spinach::FeatureSteps
  include CommonHelpers

  step '가입자' do
    user_destroy_all
    @user = get_test_user
  end

  step '검색어를 포함하는 글 리스트 생성' do
    @keyword = '수지'
    @user.messages.create(:message => '수지야 안녕')
    @user.messages.create(:mesasge => '저수지')
  end

  step '검색어를 포함하지 않는 글 리스트 생성' do
    @user.messages.create(:message => '안녕하세요, 반갑습니다.')
    @user.messages.create(:mesasge => '저수원에서 살아요')
  end

  step '검색어 입력' do
    
  end

  step '결과 글 리스트에서 검색어 포함 확인' do
    pending 'step not implemented'
  end

  step '검색어를 포함하지 않는 결과 글 없음을 확인' do
    pending 'step not implemented'
  end
end
