class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
      log_in @user
      flash[:success] = "Account created"
      redirect_to @user
    else 
      render 'new'
    end
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    unless logged_in? && @user == @current_user
      flash[:danger] = "You cannot modify someone else's account"
      redirect_to root_path
    end
  end

  def update
  	 @user = User.find(params[:id])

  	if @user.update(user_params)
    redirect_to user_path
  	else
    	render 'edit'
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	if @user.destroy
      redirect_to root_path
      flash[:success] = 'account deleted'
    end
  end

 private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
