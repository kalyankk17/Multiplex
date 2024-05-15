require_relative 'generate_ticket_invoice' # Add missing import statement

class TicketBooking
	def initialize(selected_seats, screen_deails, generate_ticket_invoice: GenerateTicketInvoice)
		@selected_seats = selected_seats
		@screen_deails = screen_deails
		@generate_ticket_invoice = generate_ticket_invoice 
	end

	def book_ticket
		update_seat_availability
		@generate_ticket_invoice.new(@screen_deails).print
	end

	def update_seat_availability
		seats = @selected_seats.split()

		seats.each do |seat|
			update_latest_seat_availability(seat[0].to_sym, seat[1..-1].to_i)
		end
	end

	def update_latest_seat_availability(seat_type, seat_number)
		case seat_type
		when :d
			seat = @screen_deails[:available][:diamond_seats].find { | seat| seat.number == seat_number  }

			@screen_deails[:available][:diamond_seats].delete(seat)
			@screen_deails[:booked][:diamond_seats] << seat
		when :n
			seat = @screen_deails[:available][:diamond_seats].find { | seat| seat.number == seat_number  }

			@screen_deails[:available][:normal_seats].delete(seat)
			@screen_deails[:booked][:normal_seats] << seat
		when :g
			seat = @screen_deails[:available][:diamond_seats].find { | seat| seat.number == seat_number  }

			@screen_deails[:available][:gold_seats].delete(seat)
			@screen_deails[:booked][:gold_seats] << seat
			puts "Invalid seat selection"
		end
	end
end
