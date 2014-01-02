class Spinach::Features::AutoLogin < Spinach::FeatureSteps
  include CommonSteps
    
  # 가압자를 community server에 생성
  # 가입자를 API Server에 생성
  step '사용자 설정 페이지 접속' do
    if @user
      visit(user_path(@user))
    else 
      visit("/users")
    end
  end

  step '가입화면으로 이동' do
    current_path.should == new_user_path;
  end

  step '로그인이 된 사용자' do
    create_test_user_to_api_server

    @user = get_test_user
    remember_token = User.new_remember_token
    @user.update!(:remember_token => User.encrypt(remember_token))
    
    headers = {}
    Rack::Utils.set_cookie_header!(headers, "remember_token", remember_token)
    cookie_string = headers['Set-Cookie']
    page.driver.browser.set_cookie(cookie_string)
  end

  step '사용자 설정 페이지로 이동' do
    current_path.should == user_path(@user)
  end

  step '쿠키를 지운 가입자' do
    create_test_user_to_api_server

    @user = get_test_user
    
    headers = {}
    Rack::Utils.set_cookie_header!(headers, "remember_token", nil)
    cookie_string = headers['Set-Cookie']
    page.driver.browser.set_cookie(cookie_string)
  end

  step '존을 이탈한 가입자' do
    create_test_user_to_api_server

    @user = get_test_user
    remember_token = User.new_remember_token
    @user.update!(:remember_token => nil)
    
    headers = {}
    Rack::Utils.set_cookie_header!(headers, "remember_token", remember_token)
    cookie_string = headers['Set-Cookie']
    page.driver.browser.set_cookie(cookie_string)
  end

  step '쿠키가 없고 존을 진출한 사용자' do
    create_test_user_to_api_server
    
    @user = get_test_user
    @user.update!(:remember_token => nil)
    
    headers = {}
    Rack::Utils.set_cookie_header!(headers, "remember_token", nil)
    cookie_string = headers['Set-Cookie']
    page.driver.browser.set_cookie(cookie_string)
  end
end
