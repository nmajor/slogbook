class RemoveDobAddYob < ActiveRecord::Migration
  def up
    remove_column :users, :dob
    add_column :users, :yob, :integer
  end

  def down
    remove_column :users, :yob
    add_column :users, :dob, :date
  end
end
