class UsersController < ApplicationController

  # before_action :require_no_user!


  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end


  ##### redirect_to question
  def show
    # debugger
    render :show
  end
  # do i have to add this routes then?

  private

  def user_params
    params.require(:user).permit(:email, :password) #does order matter?
  end

end
