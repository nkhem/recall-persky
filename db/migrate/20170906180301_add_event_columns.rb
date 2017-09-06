class AddEventColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :user_id

    create_table :contiguous_timings do |t|
      # each contiguous_timing belongs to an event
      t.integer :event_id, null: false
      # each contiguous_timing belongs to an event organizer
      t.integer :user_id, null: false

      t.integer :date, null: false
      t.integer :start_time, null: false
      t.integer :end_time, null: false

    end

    add_index :contiguous_timings, :event_id

  end
end
