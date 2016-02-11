class AddDeletedAtToItemTypes < ActiveRecord::Migration
  def change
    add_column :item_types, :deleted_at, :datetime
    add_index :item_types, :deleted_at
  end
end
