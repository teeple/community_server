class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, except: [:new, :create]
  before_action :register_user_to_api, only: [:create]

  # GET /users
  # GET /users.json
  def index
    #temp current user
      # @current_user = User.first

    @tab_class = Hash.new
    @tab_class = {:followers => 'btn-deactive', 
      :not_followers => 'btn-deactive', 
      :cafes => 'btn-deactive', 
    }
    @tab = params[:tab]? params[:tab] : 'followers'
    @tab_class[@tab.to_sym] = 'btn-active'

    page_num = params[:page]? params[:page] : 1

    case params[:tab]
      when 'not_followers'
        @users = User.not_followers(@current_user,page_num)
      when 'cafes'
        @users = User.cafes(@current_user,page_num)
      else      
        @users = User.followers(@current_user,page_num)        
    end
  end

  def setting
    @user = @current_user
    #temp current user
    # @user = User.last 
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #temp current user
    # @current_user = User.last

    @tab_class = Hash.new
    @tab_class = {
      :profile => 'btn-deactive', 
      :message => 'btn-deactive', 
    }
    @tab = params[:tab]? params[:tab] : 'profile'
    @tab_class[@tab.to_sym] = 'btn-active'

    respond_to do |format|

      # following, alarm event를 선택했을 
      if params[:trigger_element]
        trigger_element = params[:trigger_element]
        
        @rel = @current_user.relations.where(:user_from => @current_user.id, :user_to => @user.id)

        if trigger_element == 'following'
          if @rel.count == 0
            @rel = Relation.create!(:user_from => @current_user.id, :user_to=> @user.id)
          else
            @rel = @rel[0]
            @rel.destroy
          end
        else
          @rel = @rel[0]
          case trigger_element
          when 'event_entry'
            @rel.event_entry =! @rel.event_entry
          when 'event_exit'
            @rel.event_exit =! @rel.event_exit
          when 'event_post'
            @rel.event_post =! @rel.event_post
          end
          @rel.save
        end
        format.js {render action: 'show'}
      else
        if params[:tab] == 'message'
          page_num = params[:page]? params[:page] : 1
          @messages = @user.messages.page(page_num)
        end

        format.html { render action: 'show' }
      end
    end

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.remote_ip = request.remote_ip

    response = Apis.get_imsi_ecgi(request.remote_ip)

   	if response.code != 200
		redirect_to new_user_path, notice: '해당 사용자가 등록되어 있지 않습니다.'
	else 
		xml_parser = Nori.new

		result = xml_parser.parse(response.body)
		@user.imsi = result['BODY']['IMSI']
		@user.ecgi = result['BODY']['ECGI']
		
		respond_to do |format|
				if @user.save
					sign_in(@user)
					format.html { redirect_to setting_path, notice: '가입을 축하합니다' }
					format.json { render action: 'show', status: :created, location: @user }
				else
					format.html { render action: 'new' }
					format.json { render json: @user.errors, status: :unprocessable_entity }
				end
		end
	end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to setting_path, notice: '프로필 수정이 완료되었습니다' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def register_user_to_api
    if ENV['API_SERVER_MOCKUP'] == 'true'
	logger.error '### ' + 'create user to api server for testing'

    	if Api.find_by_ip(request.remote_ip).nil?
      	api = Api.new(:ip => request.remote_ip, :imsi => request.remote_ip, :ecgi => request.remote_ip)
      	api.save!
    	end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user][:phone_no] = params[:user][:phone_no].tr('-', '') if not params[:user][:phone_no].nil?
      params.require(:user).permit(:user_name, :phone_no, :imsi, :ecgi, :description, :profile_img, :avatar, :expire_day, :expire_hour, :user_type)
    end

end
