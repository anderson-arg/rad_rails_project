class AddPhotoToListCategory < ActiveRecord::Migration
  def change
    add_column :list_categories, :photo, :string
  end
end
