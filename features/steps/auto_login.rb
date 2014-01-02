class Spinach::Features::AutoLogin < Spinach::FeatureSteps
  include CommonSteps
  include Rack::Test::Methods
  
  def app
    Rails.application
  end
  
  # 가압자를 community server에 생성
  # 가입자를 API Server에 생성
  step '사용자 설정 페이지 접속' do
    breakpoint
    if @user
      visit(user_path(@user))
    else 
      visit("/users")
    end
  end

  # step '가입화면으로 이동' do
  #   current_path.should == new_user_path;
  # end

  step '로그인이 된 사용자' do
    @user = get_test_user
    #POST 로 visit(), 이 때 주소는 sessions, 파라미터는 imsi, ecgi
    parameters = {imsi:@user.imsi, ecgi:@user.ecgi}
    # post sessions_path, data: @parameters
    # get sessions_path
    # visit sessions_path, :post, @parameters
    # puts response.body.inspect
    # post "http://222.235.208.216:3000/sessions", {imsi:@user.imsi, ecgi:@user.ecgi}
    # post sessions_path, {imsi:@user.imsi, ecgi:@user.ecgi}, host: "localhost", port: 3000
    # expect(response.status).to eq(201) # "Created"
    #  page.driver.post('http://localhost:3000/sessions', { :params => parameters })
    headers = {}
    Rack::Utils.set_cookie_header!(headers, key, value)
    cookie_string = headers['Set-Cookie']
    Capybara.current_session.driver.browser.set_cookie(cookie_string)
    page.driver.post('http://localhost:3000/sessions', parameters)
  end

  step '사용자 설정 페이지로 이동' do
    breakpoint
    current_path.should == user_path(@user)
  end

  step '쿠키를 지운 가입자' do
    pending 'step not implemented'
  end

  step '존을 이탈한 가입자' do
    pending 'step not implemented'
  end

  step '쿠키가 없고 존을 진출한 사용자' do
    pending 'step not implemented'
  end
end
