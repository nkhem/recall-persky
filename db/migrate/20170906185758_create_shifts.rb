class CreateShifts < ActiveRecord::Migration[5.0]
  def change
    # this will allow an event to be created without an event organizer
    change_column :contiguous_timings, :user_id, :integer, :null => true

    create_table :shifts do |t|
      t.integer :contiguous_timing_id, null: false
      t.integer :start_time, null: false
      t.integer :end_time, null: false
    end
  end
end
