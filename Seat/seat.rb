class Seat
	attr_accessor :number, :price

	def initialize(number, price: 20)
		@number = number
		@price = price
	end 
end 