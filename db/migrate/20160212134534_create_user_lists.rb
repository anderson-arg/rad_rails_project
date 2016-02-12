class CreateUserLists < ActiveRecord::Migration
  def change
    create_table :user_lists do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :list, index: true, foreign_key: true
      t.boolean :favorite
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :user_lists, :deleted_at
  end
end
