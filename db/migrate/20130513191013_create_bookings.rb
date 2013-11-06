class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :customer_id
      t.datetime :at

      t.timestamps
    end
  end
end
