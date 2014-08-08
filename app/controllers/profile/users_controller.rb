class Profile::UsersController < ApplicationController
  
  def index 
  	@user = User.find_by(email: params[:profile])

  	if @user 
  		@user 
  	else 
  		redirect_to movies_path
  	end
  end

  def show
  	@user = User.find( params[:id].to_i )
  end

  def edit
    @user = User.find_by( params[:id] )
  end

  def update
    @user = User.find( params[:id] )
    if @user.id == current_user.id
      @user.update_attributes(user_params)
      if @user.admin == true
        @user.admin = true
      end
      redirect_to movies_path
    else
      redirect_to movies_path, notice: "sorry you are not this user"
    end 

      
  end


  protected 

   def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password, :password_confirmation, :photo)
  end

end
