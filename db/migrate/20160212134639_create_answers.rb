class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :user_list, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.text :value
      t.datetime :deleted_at

      t.timestamps null: false
    end
    add_index :answers, :deleted_at
  end
end
