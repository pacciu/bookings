class AddDayToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :day, :string
  end
end
