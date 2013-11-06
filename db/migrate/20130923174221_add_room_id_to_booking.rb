class AddRoomIdToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :room_id, :integer
  end
end
