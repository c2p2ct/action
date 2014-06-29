class CreateComments < ActiveRecord::Migration
  def change
  	drop_table :comments
    create_table :comments do |t|
      t.string :user_name
      t.text :body
      t.integer :plan_id

      t.timestamps
    end
  end
end
