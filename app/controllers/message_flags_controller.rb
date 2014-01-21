class MessageFlagsController < ApplicationController
  before_action :set_message_flag, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user

  # GET /message_flags
  # GET /message_flags.json
  def index
    @message_flags = MessageFlag.all
  end

  # GET /message_flags/1
  # GET /message_flags/1.json
  def show
  end

  # GET /message_flags/new
  def new
    @message_flag = MessageFlag.new
  end

  # GET /message_flags/1/edit
  def edit
  end

  # POST /message_flags
  # POST /message_flags.json
  def create
    @message_flag = MessageFlag.new(message_flag_params)

    respond_to do |format|
      if @message_flag.save
        format.html { redirect_to @message_flag, notice: 'Message flag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @message_flag }
      else
        format.html { render action: 'new' }
        format.json { render json: @message_flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /message_flags/1
  # PATCH/PUT /message_flags/1.json
  def update
    respond_to do |format|
      if @message_flag.update(message_flag_params)
        format.html { redirect_to @message_flag, notice: 'Message flag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @message_flag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /message_flags/1
  # DELETE /message_flags/1.json
  def destroy
    @message_flag.destroy
    respond_to do |format|
      format.html { redirect_to message_flags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_flag
      @message_flag = MessageFlag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_flag_params
      params.require(:message_flag).permit(:message_id, :user_id)
    end
end
