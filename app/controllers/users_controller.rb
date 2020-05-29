class UsersController < ApplicationController
  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
  end
  def new
    @user = User.new
  end
  def index
    if !logged_in?
      redirect_to login_path
    end
      
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome ! You have been signed up!"
      login @user
      redirect_to user_url(@user)
    else
      render 'new'
      flash.alert = "Invalid Inputs"
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end
