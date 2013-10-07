class RemoveBodyColumnFromSlog < ActiveRecord::Migration
  def up
    remove_column :slogs, :body
  end

  def down
    add_column :slogs, :body
  end
end
