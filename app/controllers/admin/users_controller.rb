class Admin::UsersController < ApplicationController

  def show
    @admin = User.find(params[:id])
    if @admin.admin == true
    	all = User.all 
    	@users = all.page(params[:page]).per(1)
    	
    else
      redirect_to movies_path, notice: "Sorry you do not have these privileges!"
    end
  end

end
