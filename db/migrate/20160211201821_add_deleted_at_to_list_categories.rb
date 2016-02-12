class AddDeletedAtToListCategories < ActiveRecord::Migration
  def change
    add_column :list_categories, :deleted_at, :datetime
    add_index :list_categories, :deleted_at
  end
end
