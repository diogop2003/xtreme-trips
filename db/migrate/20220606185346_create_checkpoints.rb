class CreateCheckpoints < ActiveRecord::Migration[6.1]
  def change
    create_table :checkpoints do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :start_point
      t.boolean :end_point
      t.references :trail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
