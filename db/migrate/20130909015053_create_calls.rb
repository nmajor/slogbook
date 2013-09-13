class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :mission_id
      t.integer :user_id
      t.date :start_date

      t.timestamps
    end
    add_index :calls, :mission_id
    add_index :calls, :user_id
  end
end
