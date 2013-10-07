class CreateSlogBlocks < ActiveRecord::Migration
  def change
    create_table :slog_blocks do |t|
      t.integer :slog_id
      t.integer :image
      t.text :body

      t.timestamps
    end
    add_index :slog_blocks, :slog_id
  end
end
