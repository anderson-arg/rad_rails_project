class CreateListCategories < ActiveRecord::Migration
  def change
    create_table :list_categories do |t|
      t.string :title
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
