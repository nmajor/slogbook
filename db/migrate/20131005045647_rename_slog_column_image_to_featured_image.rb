class RenameSlogColumnImageToFeaturedImage < ActiveRecord::Migration
  def up
    rename_column :slogs, :image, :featured_image
  end

  def down
    rename_column :slogs, :featured_image, :image
  end
end
