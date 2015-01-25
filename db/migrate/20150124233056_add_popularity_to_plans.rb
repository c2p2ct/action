class AddPopularityToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :popularity, :integer, default: 0
  end
end
