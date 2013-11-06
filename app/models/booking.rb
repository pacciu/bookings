class Booking < ActiveRecord::Base
  attr_accessible :at, :finish,:day,:customer_id, :room_id
  belongs_to :customer
  belongs_to :room
end