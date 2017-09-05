class DroppTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_reps
    drop_table :users_bills
    drop_table :reps
    drop_table :bills
  end
end
