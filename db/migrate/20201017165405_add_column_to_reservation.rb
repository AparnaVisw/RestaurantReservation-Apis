class AddColumnToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :updated_guest_count, :integer
  end
end
