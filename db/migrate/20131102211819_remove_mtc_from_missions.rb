class RemoveMtcFromMissions < ActiveRecord::Migration
  def up
    remove_column :missions, :mtc
  end

  def down
    add_table :missions, :mtc, :boolean
  end
end
