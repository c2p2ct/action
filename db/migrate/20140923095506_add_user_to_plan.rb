class AddUserToPlan < ActiveRecord::Migration
  def change
    add_reference :plans, :user, index: true
  end
end
