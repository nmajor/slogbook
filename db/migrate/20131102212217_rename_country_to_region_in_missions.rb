class RenameCountryToRegionInMissions < ActiveRecord::Migration
  def up
    rename_column :missions, :country, :region
  end

  def down
    rename_column :missions, :region, :country
  end
end
