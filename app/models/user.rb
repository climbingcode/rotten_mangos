class User < ActiveRecord::Base

	has_secure_password

	has_many :reviews 

	mount_uploader :photo, ProfilePhotoUploader

	  def full_name
    "#{firstname} #{lastname}"
  end

end
