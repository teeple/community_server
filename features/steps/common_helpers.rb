module CommonHelpers
  include Rack::Test::Methods
  def app
    Rails.application
  end

  def user_not_registered
    # IP, IMSI, ECGI = (127.0.0.1, 1111111, 222222)로 비가입자를 정의
    # Community Server의 가입자 tabe에서 IMSI = 111111, ECGI = 222222 인것을 삭제 
    # API Server의 table에 IP, IMSI, ECGI = (192.168.1.63, 1111111, 222222)가 없으면 입력
    if user = User.find_by(imsi: '11', ecgi: '22')
      user.destroy
    end
    #User.delete_all
  
    create_test_user_to_api_server
    #@user = nil
    #@user
  end

  def user_logged_in
    create_test_user_to_api_server

    @user = get_test_user
    remember_token = User.new_remember_token
    @user.update!(:remember_token => User.encrypt(remember_token))
    
    headers = {}
    Rack::Utils.set_cookie_header!(headers, "remember_token", remember_token)
    cookie_string = headers['Set-Cookie']
    page.driver.browser.set_cookie(cookie_string)
  end
  
  # API 서버에 TEST User 등록
  def create_test_user_to_api_server
    if !record = Api.find_by(ip: '127.0.0.1', imsi: '11', ecgi: '22')
      Api.create!(ip: '127.0.0.1', imsi: '11', ecgi: '22')
    end
  end
  
  # API 서버에 TEST User를 등록하고, Community Server에 등록된 사용자 가져옴
	def get_test_user
    create_test_user_to_api_server
    if !user = User.find_by(imsi: '11', ecgi: '22')
      user = User.create!(:imsi => '11', :ecgi=> '22', :phone_no => '010-1111-1111', :user_name => 'user1')
    end
    user
  end
end