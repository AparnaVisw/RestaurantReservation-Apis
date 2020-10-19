class ChangeShiftTimingDatatypeInShifts < ActiveRecord::Migration[6.0]
  def change
  	  change_column :shifts, :shift_start_time, :time 
  	  change_column :shifts, :shift_end_time, :time
  end
end
