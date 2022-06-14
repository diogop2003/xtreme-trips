class AddPhotoToTrail < ActiveRecord::Migration[6.1]
  def change
    add_column :trails, :photo, :string
  end
end
