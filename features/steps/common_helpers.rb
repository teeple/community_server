module CommonHelpers
  include Rack::Test::Methods
  def app
    Rails.application
  end
  
  def create_test_user_to_api_server
    if !record = Api.find_by(ip: '127.0.0.1', imsi: '11', ecgi: '22')
      Api.create!(ip: '127.0.0.1', imsi: '11', ecgi: '22')
    end
  end
  
	def get_test_user
    create_test_user_to_api_server
    if !user = User.find_by(imsi: '11', ecgi: '22')
      user = User.create!(:imsi => '11', :ecgi=> '22')
    end
    user
  end
end