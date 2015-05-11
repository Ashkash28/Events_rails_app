class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user.nil?
  		flash[:error] = "couldn't find a user with those credentials"
  		#if there is an error, redirect back to login
  		redirect_to '/'
  	else
  		session[:user_id] = user.id
  		redirect_to '/events'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end
end
