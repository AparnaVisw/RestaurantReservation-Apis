class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.datetime :shift_start_time
      t.datetime :shift_end_time
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
