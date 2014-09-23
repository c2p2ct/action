class AddTestimonialToComments < ActiveRecord::Migration
  def change
    add_column :comments, :testimonial, :boolean
  end
end
