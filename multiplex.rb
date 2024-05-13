require_relative 'Screen/screen'

class Multiplex

	attr_accessor :screens


	def initialize(screen_class: Screen)
	  @screens = [screen_class.new(1,"aaa"), screen_class.new(2,"bbb"), screen_class.new(3,"ccc")]
	end 


	def welcome
	  puts " Welcome to The Multiplex"
	  @screens.each do |screen|
	  	puts "Screen #{screen.number} is playing #{screen.description}"
	  end
	  select_screen 
	end

	def select_screen 
	  puts "please select the screen number"
	  screen_number = gets.chomp.to_i
	  selected_screen = @screens.find { | screen| screen.number == screen_number  }
	  selected_screen.welcome
	end 
end 