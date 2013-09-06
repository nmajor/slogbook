class AddImageToSlogs < ActiveRecord::Migration
  def change
    add_column :slogs, :image, :string
  end
end
