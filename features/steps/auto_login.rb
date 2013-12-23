class Spinach::Features::AutoLogin < Spinach::FeatureSteps
  step '비가입자가 있다' do
    # IP, IMSI, ECGI = (127.0.0.1, 1111111, 222222)로 비가입자를 정의
    # Community Server의 가입자 tabe에서 IMSI = 111111, ECGI = 222222 인것을 삭제 
    # API Server의 table에 IP, IMSI, ECGI = (192.168.1.63, 1111111, 222222)가 없으면 입력
    if user = User.find_by(imsi: '1111111', ecgi: '222222')
      user.destroy
    end

    if !record = Api.find_by(ip: '127.0.0.1', imsi: '1111111', ecgi: '222222')
      Api.create!(ip: '127.0.0.1', imsi: '1111111', ecgi: '222222')
    end

  end

  step '로그인 시도' do
    # page.driver.request.headers['REMOTE_ADDR'] = '192.168.1.63'
    visit('/login')

  end

  step '가입화면으로 이동' do
    current_path.should == '/signup'
    # pending 'step not implemented'
  end

  step '가입자가 있다' do
    # 가압자를 community server에 생성
    # 가입자를 API Server에 생성
    pending 'step not implemented'
  end

  step '전체 글 리스트로 이동' do
    current_path.should == '/messages'
  end
end
