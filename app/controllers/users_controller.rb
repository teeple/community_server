class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :signed_in_user, except: [:new, :create]

  # GET /users
  # GET /users.json
  def index
    #temp current user
    @current_user = User.first

    @tab_class = Hash.new
    @tab_class = {:followers => 'btn-default', 
      :not_followers => 'btn-default', 
      :cafes => 'btn-default', 
    }
    @tab = params[:tab]? params[:tab] : 'followers'
    @tab_class[@tab.to_sym] = 'btn-primary'

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
    #temp current user
    #@user = @current_user
    @user = User.first
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #temp current user
    @current_user = User.first

    @tab_class = Hash.new
    @tab_class = {
      :profile => 'btn-default', 
      :message => 'btn-default', 
    }
    @tab = params[:tab]? params[:tab] : 'profile'
    @tab_class[@tab.to_sym] = 'btn-primary'

    respond_to do |format|
      if params[:alarm]
        @rel = @current_user.relations.where(:user_from => @current_user.id, :user_to => @user.id)[0]
        eval_str = "@rel."+params[:alarm]+"=!"+params[:checked]
        eval(eval_str)
        @rel.save
        @event_type = params[:alarm]
        format.js {render action: 'show'}
      else
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: '가입을 축하합니다' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :phone_no, :imsi, :ecgi, :description, :profile_img, :avatar)
    end


end
