class ChangeSlogBlockImageTypeToString < ActiveRecord::Migration
  def up
    change_column :slog_blocks, :image, :string
  end

  def down
    change_column :slog_blocks, :image, :integer
  end
end
