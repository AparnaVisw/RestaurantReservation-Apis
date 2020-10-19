class RemoveColumnsFromReservation < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :updated_reservation_time, :datetime
    remove_column :reservations, :updated_guest_count, :string
  end
end
