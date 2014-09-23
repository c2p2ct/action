class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :picture
      t.string :bio
      t.string :twitter
      t.string :facebook

      t.timestamps
    end
  end
end
