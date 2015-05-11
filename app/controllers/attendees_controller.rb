class AttendeesController < ApplicationController
  def index
  end

  def create
  	@attendee = Attendee.new(attendee_params)
  	@attendee.save

  	redirect_to '/events/index'
  end

  def destroy
  	puts params

  	Attendee.where(user_id: params[:user_id]).where(event_id: params[:event_id]).destroy_all
  	redirect_to '/events/index'
  end

  def show
  end

  private
  	def attendee_params
  		params.require(:attendee).permit(:user_id, :event_id)
  	end
end
