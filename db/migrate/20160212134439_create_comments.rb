class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user_list, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text :text
      t.boolean :is_active
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :comments, :deleted_at
  end
end
