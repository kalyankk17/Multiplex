require_relative 'seat'

class DiamondSeat < Seat
	attr_accessor :number, :price

	def initialize(number, price: 30)
		super(number, price: price)
	end 
end 