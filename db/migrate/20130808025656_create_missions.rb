class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.string :country
      t.boolean :mtc

      t.timestamps
    end
  end
end
