class AddDobGenderFirstNameLastNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :gender, :character
    add_column :users, :dob, :date
  end
end
