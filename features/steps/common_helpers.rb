module CommonHelpers
  include Rack::Test::Methods
  
  def clear_all_database
    User.destroy_all
    Message.destroy_all
    Relation.destroy_all
    MessageFlag.destroy_all
    SmsNotification.destroy_all
    Api.destroy_all
    Event.destroy_all
  end
  
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
      user = User.create!(:imsi => '11', :ecgi=> '22', :phone_no => '01011111111', :user_name => 'user1')
    end
    user
  end

  def user_destroy_all
    User.destroy_all
  end 

  def generate_common_data
    hash = YAML.load(File.read("#{Rails.root}/features/steps/common_data.yml"))
  end

  def create_related_user(user_from,user_type,postfix,following)
    user_name = (user_type == true)? 'cafe': 'user'
    user = User.create!(:user_name => user_name + postfix, :phone_no => '010111122' + postfix, :imsi => '11' + postfix, :ecgi => '11' + postfix, :user_type => user_type)
    Relation.create!(:user_from => user_from, :user_to => user.id) if following
    user
  end

  def create_my_follower(user_to, user_type, postfix, ecgi, event_post, event_entry, event_exit)
    user_name = (user_type == true)? 'myfollower_cafe_': 'myfollower_user_'
    user = User.create!(:user_name => user_name + postfix, :phone_no => '010111122' + postfix, :imsi => '11' + postfix, :ecgi => ecgi, :user_type => user_type)
    Relation.create!(:user_from => user.id, :user_to => user_to.id, :event_post => event_post, :event_entry => event_entry, :event_exit => event_exit )
    user
  end

  def create_user_in_api(imsi, ecgi)
    api = Api.create!(:imsi => imsi, :ecgi => ecgi)
  end

  def create_related_user_with_name_and_description(user_name,user_from,user_type,postfix,following,description)
    user = User.create!(:user_name => user_name, :phone_no => '010111122' + postfix, :imsi => '11' + postfix, :ecgi => '11' + postfix, :user_type => user_type, :description => description)
    Relation.create!(:user_from => user_from, :user_to => user.id) if following
    user
  end

end