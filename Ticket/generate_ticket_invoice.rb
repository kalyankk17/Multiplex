class GenerateTicketInvoice
    def initialize(screen_details)
        @screen_details = screen_details
        @total_amount = 0
    end 

    def print 
        @screen_details[:booked]&.each do |seat_type, seats|
            next if seats.empty?
            amount = seats.length * seats[0].price
            puts "#{seats.length} #{seat_type} tickets costs #{amount}"
            @total_amount += amount
        end
        puts "Total Amount: #{@total_amount}"
        puts "Thank you for booking the tickets"
    end  
end 