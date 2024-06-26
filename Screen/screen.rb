require_relative 'screen_builder'
require "./Ticket/ticket_booking"

class Screen

	attr_accessor :number, :description

	def initialize(number, description,screen_builder: ScreenBuilder, ticket_booking: TicketBooking )
		@number = number
		@description = description
		@screen_builder = screen_builder.new
		@ticket_booking = ticket_booking
	end


	def welcome
		puts "Welcome to screen #{number}"
		@screen_builder.build
        available_screen_seats
	end  

	def available_screen_seats
		puts "Available screen seats"
        @screen_builder.seats[:available].each do |key, value|
        	value.each do |seat|
		       puts "#{key[0]}#{seat.number}"
		    end
        end
        puts "Select seats "
        selected_seats = gets.chomp
        puts "selected_seats #{selected_seats}" 
        initialize_ticket_booking(selected_seats)
	end 

	def initialize_ticket_booking(selected_seats)
        @ticket_booking.new(selected_seats,@screen_builder.seats).book_ticket
	end 
end 