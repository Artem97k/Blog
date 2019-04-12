class SessionsController < ApplicationController
  def create
      if not logged_in? 
	  user = User.find_by(login: params[:login], password: params[:password])
	  if user != nil
		session[:current_user_id] = user.id
		redirect_to user_path(user.id)
	  else 
		flash[:notice] = "User not found!"
		redirect_to action: "new"
	  end
	  else
	    redirect_to root_path
	  end
  end

  def destroy
    if logged_in?
		@current_user = session[:current_user_id] = nil
		redirect_to root_url
		else
		  redirect_to root_url
	end
  end
  
  def new
  end
end
