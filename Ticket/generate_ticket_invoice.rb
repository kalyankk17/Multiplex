class GenerateTicketInvoice
    def initialize
        @screen_details = screen_details
        @total_amount = 0
    end 

    def print 
        @screen_details.seats[:booked].each do |seat_type, seats|
            amount = seats.length * seats[0].price
            puts "#{seats.length} #{seat_type} tickets costs #{amount}"
            @total_amount += seats.length * seats[0].price
        end
        puts "Total Amount: #{@total_amount}"
        puts "Thank you for booking the tickets"
    end 
end 