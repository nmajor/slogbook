class AddActiveToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :active, :boolean
  end
end
