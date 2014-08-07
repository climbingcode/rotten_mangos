class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to movies_path, notice: "Welcome aboard, #{@user.firstname}!"
    else
      render :new
    end
  end

  def show
    
  end

  def destroy 
    user = User.find(params[:id].to_i)
    # user.delete
    UserMailer.delete_email(user).deliver
    redirect_to admin_users_path
  end


  def update
    @user = User.find(params[:id].to_i)
    @user.update_attributes(
      email: params[:user][:email],
      firstname: params[:user][:firstname],
      lastname: params[:user][:lastname]
      ) 

    if params[:admin] == "1"
        @user.admin = true
    end 
    @user.save

    
    redirect_to admin_users_path

  end


  protected 

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation)
  end

end
