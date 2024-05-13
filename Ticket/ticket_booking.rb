require_relative 'generate_ticket_invoice' # Add missing import statement

class TicketBooking
	def initialize(selected_seats, screen_deails, generate_ticket_invoice: GenerateTicketInvoice.new)
		@selected_seats = selected_seats
		@screen_deails = screen_deails
		@generate_ticket_invoice = generate_ticket_invoice 
	end

	def book_ticket
		update_seat_availability
		generate_ticket_invoice.print
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
			@screen_deails.seats[:available][:diamond_seats].delete(seat_number)
			@screen_deails.seats[:booked][:diamond_seats].push(seat_number)
		when :n
			@screen_deails.seats[:available][:normal_seats].delete(seat_number)
			@screen_deails.seats[:booked][:normal_seats].push(seat_number)
		when :g
			@screen_deails.seats[:available][:gold_seats].delete(seat_number)
			@screen_deails.seats[:booked][:gold_seats].push(seat_number)
		else
			puts "Invalid seat selection"
		end
	end
end
