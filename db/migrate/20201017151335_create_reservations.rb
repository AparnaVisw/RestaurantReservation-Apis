class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.datetime :reservation_time
      t.datetime :updated_reservation_time
      t.references :table, null: false, foreign_key: true
      t.references :shift, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true
      t.integer :guest_count

      t.timestamps
    end
  end
end
