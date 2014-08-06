module Admin::UsersHelper

	def user_is_admin?(current_user) 
		current_user.admin == true
	end

end
