class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.string :picture

      t.timestamps
    end
  end
end
