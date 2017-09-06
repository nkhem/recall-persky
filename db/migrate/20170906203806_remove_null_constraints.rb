class RemoveNullConstraints < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :event_url, ""
    change_column_default :events, :img_url, ""
    change_column_default :events, :public_details, ""
    change_column_default :events, :private_notes, ""

    change_column_null :events, :street_address2, false
    change_column_default :events, :street_address2, ""

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
