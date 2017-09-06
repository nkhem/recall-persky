class RemoveNullConstraints < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :event_url, :string, :default => ""
    change_column :events, :img_url, :string, :default => ""
    change_column :events, :public_details, :default => ""
    change_column :events, :private_notes, :default => ""
    change_column :events, :street_address2, :null=> false, :default => ""

    remove_column :contiguous_timings, :date
    remove_column :contiguous_timings, :start_time
    remove_column :contiguous_timings, :end_time

    add_column :contiguous_timings, :start_datetime, :datetime
    add_column :contiguous_timings, :end_datetime, :datetime

    remove_column :shifts, :start_time
    remove_column :shifts, :end_time

    add_column :shifts, :start_datetime, :datetime
    add_column :shifts, :end_datetime, :datetime
  end
end
