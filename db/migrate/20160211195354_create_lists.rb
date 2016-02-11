class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :description
      t.boolean :is_private
      t.boolean :is_active
      t.references :user, index: true, foreign_key: true
      t.references :list_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
