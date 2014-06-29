class Plan < ActiveRecord::Base

	mount_uploader :picture, PictureUploader
	has_many :steps
	has_many :comments


 	extend FriendlyId
  	friendly_id :name, use: :slugged

  # def should_generate_new_friendly_id?
  #   new_record?
  # end
end
