class CreateUsersShifts < ActiveRecord::Migration[5.0]
  def change
    create_table :users_shifts do |t|
      t.integer :user_id, null: false
      t.integer :shift_id, null: false
      t.timestamp
    end

    # add timestamps to contiguous_timings and shifts tables
    add_column :contiguous_timings, :created_at, :datetime, null: false
    add_column :shifts, :created_at, :datetime, null: false
    add_column :contiguous_timings, :updated_at, :datetime, null: false
    add_column :shifts, :updated_at, :datetime, null: false
  end
end
