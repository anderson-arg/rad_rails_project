class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :list, index: true, foreign_key: true
      t.belongs_to :item_type, index: true, foreign_key: true
      t.text :text
      t.boolean :is_private
      t.integer :order
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :items, :deleted_at
  end
end
