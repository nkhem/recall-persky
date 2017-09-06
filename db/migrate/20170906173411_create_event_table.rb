class CreateEventTable < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false

      t.string :street_address1, null: false
      t.string :street_address2
      t.string :city, null: false
      t.string :event_url, null: false
      t.string :img_url, null: false

      #for use by event organizer
      t.integer :user_id, null: false
      t.string :public_details, null: false
      t.string :private_notes, null: false

      t.timestamps
    end
  end
end
