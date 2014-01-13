class SmsNotificationsController < ApplicationController
  before_action :set_sms_notification, only: [:show, :edit, :update, :destroy]

  # GET /sms_notifications
  # GET /sms_notifications.json
  def index
    @sms_notifications = SmsNotification.all
  end

  # GET /sms_notifications/1
  # GET /sms_notifications/1.json
  def show
  end

  # GET /sms_notifications/new
  def new
    @sms_notification = SmsNotification.new
  end

  # GET /sms_notifications/1/edit
  def edit
  end

  # POST /sms_notifications
  # POST /sms_notifications.json
  def create
    @sms_notification = SmsNotification.new(sms_notification_params)

    respond_to do |format|
      if @sms_notification.save
        format.html { redirect_to @sms_notification, notice: 'Sms notification was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sms_notification }
      else
        format.html { render action: 'new' }
        format.json { render json: @sms_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sms_notifications/1
  # PATCH/PUT /sms_notifications/1.json
  def update
    respond_to do |format|
      if @sms_notification.update(sms_notification_params)
        format.html { redirect_to @sms_notification, notice: 'Sms notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sms_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sms_notifications/1
  # DELETE /sms_notifications/1.json
  def destroy
    @sms_notification.destroy
    respond_to do |format|
      format.html { redirect_to sms_notifications_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sms_notification
      @sms_notification = SmsNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sms_notification_params
      params.require(:sms_notification).permit(:receiver_user_id, :integer, :sms_message, :text, :receiver_phone_no, :string, :event_type, :string, :sent_at, :datetime, :status, :string, :error_reason)
    end
end
