class RenameUserImageColToAvatar < ActiveRecord::Migration
  def up
    rename_column :users, :image, :avatar
  end

  def down
    rename_column :users, :avatar, :image
  end
end
