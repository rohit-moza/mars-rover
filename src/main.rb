require_relative "./rover"
require_relative "./extract_input"
require 'pp'
require 'byebug'
require_relative './get_new_heading_position'
require_relative './constants'

@rovers = []
@rover_count = 0 


def start_rover_program
  puts "--- WELCOME TO MARS ROVER CONTROL MODULE ---"
  puts "START BY ENTERING THE MAX UPPER RIGHT CO-ORDINATES OF THE PLATEAU"
  @upper_right_co_ordinates = ExtractInput.new(gets, 1).upper_right_co_ordinates
  puts "YOU CAN NOW START LANDING ROVERS WITH MOVEMENT INSTRUCTIONS"
end

def land_new_rover
  "LANDING NEW ROVER"
  new_rover = Rover.new(@initial_rover_position, @initial_rover_heading, @rover_control_instructions)
  @rovers[@rover_count] = new_rover
  @rover_count +=1
end

def get_new_rover_position_heading 
  initial_rover_position_heading = gets
  @initial_rover_position = ExtractInput.new(initial_rover_position_heading, 2).initial_position
  @initial_rover_heading = ExtractInput.new(initial_rover_position_heading, 2).initial_heading
end

def get_control_instructions
  @rover_control_instructions = gets.strip
end

def setup_new_rover
  get_new_rover_position_heading 
  get_control_instructions
  land_new_rover
  puts "Do you want to add more rovers? Type y to continue Or any other input to exit and view landed rovers"
  add_more_rovers = gets.strip
  setup_new_rover if add_more_rovers == 'y'
end

def dimension_constraint_met(axis, new_position_requested, current_rover_position)
  (new_position_requested[axis] <= @upper_right_co_ordinates[axis]) && (new_position_requested[axis] >= 0)
end

def allowed_to_change_position(new_position_requested, current_rover_position)
  x_constraint_met = dimension_constraint_met(X, new_position_requested, current_rover_position)
  y_constraint_met = dimension_constraint_met(Y, new_position_requested, current_rover_position)
  x_constraint_met && y_constraint_met
end

def execute_control_instructions_for_all_rovers
  @rovers.each do |rover|
    
    rover.control_instructions.each_char {|instruction|
      if /M/.match(instruction)  
        new_position_requested = GetNewHeadingPosition.get_new_position(rover.heading, rover.position)
        rover.position = new_position_requested if allowed_to_change_position(new_position_requested, rover.position)
      elsif /(L|R)/.match(instruction)
        rover.heading = GetNewHeadingPosition.get_new_heading(rover.heading, instruction)
      else
        puts "INVALID REQUEST DO NOTHING"
      end
    }
  end
end

start_rover_program
puts "WHERE DO YOU WANT TO LAND YOUR ROVER? SPECIFY x y and heading"
setup_new_rover
puts "ROVERS LANDED SEE WHAT THEY LOOK LIKE CREATED!!"
pp @rovers
execute_control_instructions_for_all_rovers
puts "ROVERS LANDED SEE WHAT THEY LOOK LIKE AFTER COMMAND EXECUTION!!"
pp @rovers









