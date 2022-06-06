class CreateTrails < ActiveRecord::Migration[6.1]
  def change
    create_table :trails do |t|
      t.string :mode
      t.float :distance
      t.string :name
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
