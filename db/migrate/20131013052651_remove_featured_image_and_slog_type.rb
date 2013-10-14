class RemoveFeaturedImageAndSlogType < ActiveRecord::Migration
  def up
    remove_column :slogs, :slog_type
    remove_column :slogs, :featured_image
    drop_table :slog_types
  end

  def down
    create_table :slog_types do |t|
      t.string :name
      t.timestamps
    end
    add_column :slogs, :image, :string
    add_column :slogs, :slog_type_id, :integer
  end
end
