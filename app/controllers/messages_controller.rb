class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  #before_action :signed_in_user
  
  # GET /messages
  # GET /messages.json
  def index
    #temp current user
    @current_user = User.first

    page_num = params[:page]? params[:page] : 1

    @messages = Message.friends_messages(@current_user,page_num)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    #temp current user
    @current_user = User.find(23)
    
    @message = @current_user.messages.build(message_params)
    
    respond_to do |format|
      if @message.save
        format.html { redirect_to new_message_path, notice: '새 글이 등록되었습니다' }
        format.json { render action: 'show', status: :created, location: @message }
      else
        format.html { render action: 'new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message, :message_img, :user_id,:attached_img,:expired_at)
      # params[:message][:expired_at] = params[:message][:expired_at].to_datetime
    end
end
