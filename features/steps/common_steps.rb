module CommonSteps
	include Spinach::DSL
  include CommonHelpers
  
	# step '비가입자' do
	#   # IP, IMSI, ECGI = (127.0.0.1, 1111111, 222222)로 비가입자를 정의
 #    # Community Server의 가입자 tabe에서 IMSI = 111111, ECGI = 222222 인것을 삭제 
 #    # API Server의 table에 IP, IMSI, ECGI = (192.168.1.63, 1111111, 222222)가 없으면 입력
 #    if user = User.find_by(imsi: '1111111', ecgi: '222222')
 #      user.destroy
 #    end
 #    #User.delete_all

 #    create_test_user_to_api_server
 #    @user = nil
 #    @user
	# end
	
end