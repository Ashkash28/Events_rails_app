class EventsController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
  	@events = Event.all
    @attendees = Attendee.where(user_id: @user)

  end

  def create
  	@event = Event.new(event_params)
  	if @event.save
  		flash[:notice] = 'Event is created'
  		redirect_to '/events/index'
  	else
  		flash[:errors] = @event.errors.full_messages
  		redirect_to '/events/create'
  	end
  end

  def show
  	@event = Event.find(params[:id])
    @attendees = Attendee.joins(:event).joins(:user).where(event_id: params[:id]).select("users.first_name, users.city, users.state")
    @user = session[:user_id]
    @comments = Comment.joins(:event).joins(:user).where(event_id: params[:id]).select("users.first_name, comments.comment")
    @count = Attendee.joins(:event).joins(:user).where(event_id: params[:id]).count
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to '/events/index'
  end

  private
  	def event_params
  		params.require(:event).permit(:name, :date, :city, :state, :user_id)
  	end
end
