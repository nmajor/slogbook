class AddTypeColumnToSlogsAgain < ActiveRecord::Migration
  def change
    add_column :slogs, :slog_type_id, :integer
  end
end
