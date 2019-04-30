class SessionsController < ApplicationController
  def new

  end
  def create
    user = User.find_by(name: params[:name]) 
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:danger] ||= "Incorrect Name or Password"
      render 'new'
    end
    
  end

end