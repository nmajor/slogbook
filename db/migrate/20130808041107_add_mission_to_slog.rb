class AddMissionToSlog < ActiveRecord::Migration
  def change
    add_column :slogs, :mission_id, :integer
  end
end
