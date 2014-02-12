class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    xml_parser = Nori.new
    result = xml_parser.parse(request.body.read)

logger.error '### ' + request.body.read

    imsi = result['BODY']['IMSI']
    in_or_out = result['BODY']['EVENT']

    hash_event_type = Hash.new
    hash_event_type[:IN] = 'entry'
    hash_event_type[:OUT] = 'exit'

    event_type = hash_event_type[in_or_out.to_sym]

    event = Event.create!(:event_type => event_type)

    # get user with imsi
    user = User.find_by_imsi(imsi)

    case event_type
     when 'entry'
       # find relation
       relations = User.relation_follows_me_with_entry(user)
       sms_message = user.user_name + ' 님이 ' + ENV['COM_SERVER_NAME'] + '에 진입하셨습니다.'

       # 진입한 사용자가 following하는 사람들의 새글이 존재할 때, 그 그들을 전송한다.
       message_flags = MessageFlag.where(:user_to => user.id).includes(:followee)

       followee_hash = Hash.new

       message_flags.each do |message_flag|
        
        if followee_hash[message_flag.user_from.to_s.to_sym] 
          next 
        end
        followee_hash[message_flag.user_from.to_s.to_sym] = true
          
        message_count = MessageFlag.where(:user_to => user.id, :user_from => message_flag.user_from).count
       
       
        sms_message1 = message_flag.followee.user_name + "님의 새 글이 " + message_count.to_s + " 건 있습니다. " 
        sms_message2 = ENV['COM_SERVER_URL'] + '/users/' +  message_flag.followee.id.to_s + '?tab=message'
        sms_message3 = sms_message1 + sms_message2

        SmsNotification.create!(
          :receiver_user_id => user.id, 
          :sms_message => sms_message3, 
          :receiver_phone_no => user.phone_no, 
          :event_type => event.event_type,
          :event_id => event.id,
          :status => 'NEW')
       end

     when 'exit'
       relations = User.relation_follows_me_with_exit(user)
       sms_message = user.user_name + ' 님이 ' + ENV['COM_SERVER_NAME'] + '에서 이탈하셨습니다.'
     else 
      event.destroy
      render status: 500
    end

    relations.each do | relation |
      SmsNotification.create!(
              :receiver_user_id => relation.follower.id, 
              :sms_message => sms_message, 
              :receiver_phone_no => relation.follower.phone_no, 
              :event_type => event.event_type, 
              :event_id => event.id,
              :status => 'NEW')
    end


    render nothing: true
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:event_type)
    end
end
