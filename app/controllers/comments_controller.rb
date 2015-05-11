class CommentsController < ApplicationController
  def new
  end

  def create
  	@comment = Comment.new(comment_params)
  	@comment.save
  	# puts '\n\n\n\n\n hiiiii', comment_params["event_id"]
  	# fail
  	redirect_to "/events/show/#{comment_params['event_id']}" 
  end

  private
  	def comment_params
  		params.require(:comment).permit(:comment, :user_id, :event_id)
  	end
end
