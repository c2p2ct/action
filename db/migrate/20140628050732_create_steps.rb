class CreateSteps < ActiveRecord::Migration
  def change
  	drop_table :plan_steps

    create_table :steps do |t|
      t.integer :sequence
      t.text :planstep
      t.integer :plan_id

      t.timestamps
    end
  end
end
