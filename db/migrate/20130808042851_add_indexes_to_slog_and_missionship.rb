class AddIndexesToSlogAndMissionship < ActiveRecord::Migration
  def change
    add_index :missionships, :user_id
    add_index :missionships, :mission_id
    add_index :slogs, :user_id
    add_index :slogs, :slog_type_id
    add_index :slogs, :mission_id
  end
end
