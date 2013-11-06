class Customer < ActiveRecord::Base
  attr_accessible :cognome, :email, :nome, :telefono,:nick
  has_many :bookings
end