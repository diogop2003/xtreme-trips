class AddPhotoToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photo, :string
    add_column :users, :address, :string
    add_column :users, :name, :string
    add_column :users, :contact, :string
  end
end
