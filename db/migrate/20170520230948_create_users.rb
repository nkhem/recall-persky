class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false

      t.string :f_name, null: false
      t.string :l_name, null: false
      t.string :prefix, null: false
      t.string :email, null: false
      t.string :phone_number, null: false

      t.string :password_digest, null: false
      t.string :session_token, null: false

      t.timestamps
    end

    add_index :users, :email
  end
end
