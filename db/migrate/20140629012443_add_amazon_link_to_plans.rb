class AddAmazonLinkToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :amazonlink, :text
  end
end
