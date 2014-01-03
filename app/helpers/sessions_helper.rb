module SessionsHelper
  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    # cookie가 있을 때
    if cookies[:remember_token]
      remember_token  = User.encrypt(cookies[:remember_token])
      @current_user ||= User.find_by(remember_token: remember_token)
    end

    # API 서버 확인 후 가입자이면 로그인 처리
    # 가입자가 아니면 가입 페이지로 이동
    if !@current_user
      ip_address = request.remote_ip
      # call API server with ip_address
      response = get_imsi_ecgi(ip_address)  
      if response.code == 200
        xml_parser = Nori.new
        
        result = xml_parser.parse(response.body)
        imsi = result['BODY']['IMSI']
        ecgi = result['BODY']['ECGI']
        
        user = User.find_by imsi: imsi, ecgi:ecgi
        if user
          sign_in user
        end
      end
    end
    @current_user

  end

  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to new_user_path, notice: "회원가입"
    end
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
  
end
