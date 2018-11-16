class SessionsController < ApplicationController
  # before_action :require_no_user!, only: i(create) What is this?

  def create
    debugger
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ['Invalid email and/or password']
      render :new
    else
      log_in_user!(user)
      redirect_to user_url(user) #correct? do I have to add show to UsersController
    # if user
    #   log_in_user!(user)
    #   redirect_to user_url(user) #correct? do I have to add show to UsersController
    # else
    #   flash.now[:errors] = ['Invalid email and/or password']
    #   render :new
    end
  end

  def destroy
  end

  def new
    render :new
  end


end
