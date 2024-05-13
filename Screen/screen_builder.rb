require "./Seat/seat"
require "./Seat/diamond"
require "./Seat/gold"

class ScreenBuilder

	attr_accessor :seats

	def initialize(normal_seat: Seat, gold_seat: GoldSeat, diamond_seat: DiamondSeat )
		@normal_seat = normal_seat
		@gold_seat = gold_seat
		@diamond_seat = diamond_seat
		@seats = {available: {normal_seats: [], gold_seats: [], diamond_seats: []}, booked: {normal_seats: [], gold_seats: [], diamond_seats: []}}
	end

	def build
		(1...20).each do |i|
		  @seats[:available][:normal_seats] << @normal_seat.new(i)
	      @seats[:available][:diamond_seats] << @diamond_seat.new(i)
	      @seats[:available][:gold_seats] << @gold_seat.new(i)
		end
	end

end