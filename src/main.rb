require_relative "./rover"
require_relative "./extract_input"
require 'pp'
require 'byebug'

@rovers = {}
@rover_count = 0 

def start_rover_program
  puts "--- WELCOME TO MARS ROVER CONTROL MODULE ---"
  puts "START BY ENTERING THE MAX UPPER RIGHT CO-ORDINATES OF THE PLATEAU"
  upper_right_co_ordinates = ExtractInput.new(gets, 1).upper_right_co_ordinates
  puts "YOU CAN NOW START LANDING ROVERS WITH MOVEMENT INSTRUCTIONS"
end

def land_new_rover
  puts "WHERE DO YOU WANT TO LAND YOUR ROVER? SPECIFY x y and heading"
  initial_rover_position_heading = gets
  initial_rover_position = ExtractInput.new(initial_rover_position_heading, 2).initial_position
  initial_rover_heading = ExtractInput.new(initial_rover_position_heading, 2).initial_heading

  " CREATING NEW ROVER "
  new_rover = Rover.new(initial_rover_position, initial_rover_heading)
  @rover_count +=1
  @rovers["Rover#{@rover_count}"] = new_rover

  puts "Do you want to add more rovers? Type y to continue Or any other input to exit and view landed rovers"
  add_more_rovers = gets[0]
  land_new_rover if add_more_rovers == 'y'
end


start_rover_program
land_new_rover
puts "ROVERS LANDED SEE WHAT THEY LOOK LIKE!!"
pp @rovers







