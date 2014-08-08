class Admin::UsersController < ApplicationController

	def index
    if current_user.admin
    	@users = User.all.page(params[:page]).per(10)
    else
      redirect_to movies_path, notice: "Sorry you do not have these privileges!"
    end
	end

  def show
    session[:user_id] = session[:fake]
    session[:fake] = nil
    redirect_to admin_users_path
  end

  def reset

  end

  def edit 
    @user = User.find(params[:id].to_i)
  end

  def update
    @user = User.find(params[:id].to_i)
  end

end
