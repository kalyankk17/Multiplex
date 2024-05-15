require_relative 'seat'


class GoldSeat < Seat

	def initialize(number, price: 20)
		super(number, price: price)
	end 
end 
