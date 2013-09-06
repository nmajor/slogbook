class CreateMissionships < ActiveRecord::Migration
  def change
    create_table :missionships do |t|
      t.integer :mission_id
      t.integer :user_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
