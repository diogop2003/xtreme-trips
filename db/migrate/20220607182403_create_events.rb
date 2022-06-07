class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :name
      t.references :trail, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
