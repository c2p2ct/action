class Plan < ActiveRecord::Base

	mount_uploader :picture, PictureUploader
	has_many :steps
	has_many :comments
  accepts_nested_attributes_for :steps
  
 	extend FriendlyId
  	friendly_id :name, use: :slugged

  	validates_presence_of :name
  	validates_presence_of :description

  # def should_generate_new_friendly_id?
  #   new_record?
  # end


  	def self.search(query)
  		where("name like ?", "%#{query}%") 
	end

end
