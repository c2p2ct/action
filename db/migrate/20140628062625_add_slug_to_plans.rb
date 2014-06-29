class AddSlugToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :slug, :string
      

  end
end


