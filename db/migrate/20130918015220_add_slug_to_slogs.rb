class AddSlugToSlogs < ActiveRecord::Migration
  def change
    add_column :slogs, :slug, :string
    add_index :slogs, :slug, unique: true
  end
end
