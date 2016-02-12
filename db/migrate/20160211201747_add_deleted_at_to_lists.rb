class AddDeletedAtToLists < ActiveRecord::Migration
  def change
    add_column :lists, :deleted_at, :datetime
    add_index :lists, :deleted_at
  end
end
