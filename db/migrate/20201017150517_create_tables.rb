class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :guest_min_no
      t.integer :guest_max_no
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
