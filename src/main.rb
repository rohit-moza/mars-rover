require_relative "./rover"
require_relative "./extract_input"
require 'pp'
require 'byebug'
require_relative './get_new_heading_position'
require_relative './constants'

@rovers = []
@rover_count = 0 

def land_new_rover
  new_rover = Rover.new(@initial_rover_position, @initial_rover_heading, @rover_control_instructions)
  @rovers[@rover_count] = new_rover
  @rover_count +=1
end

def get_new_rover_position_heading(line) 
  initial_rover_position_heading = line
  @initial_rover_position = ExtractInput.new(initial_rover_position_heading, 2).initial_position
  @initial_rover_heading = ExtractInput.new(initial_rover_position_heading, 2).initial_heading
end

def get_control_instructions(line)
  @rover_control_instructions = line
end

def dimension_constraint_met(axis, new_position_requested)
  (new_position_requested[axis] <= @upper_right_co_ordinates[axis]) && (new_position_requested[axis] >= 0)
end

def allowed_to_change_position(new_position_requested)
  x_constraint_met = dimension_constraint_met(X, new_position_requested)
  y_constraint_met = dimension_constraint_met(Y, new_position_requested)
  x_constraint_met && y_constraint_met
end

def execute_control_instructions_for_all_rovers
  @rovers.each do |rover|
    rover.control_instructions.each_char {|instruction|
      if /M/.match(instruction)  
        new_position_requested = GetNewHeadingPosition.get_new_position(rover.heading, rover.position)
        rover.position = new_position_requested if allowed_to_change_position(new_position_requested)
      elsif /(L|R)/.match(instruction)
        rover.heading = GetNewHeadingPosition.get_new_heading(rover.heading, instruction)
      else
        rover.errors << {timestamp: Time.now, description: "tried to execute invalid control instruction: #{instruction}"}
      end
    }
  end
end

File.open("./input.txt", "r") do |f|
  new_rover_intake_status = ''
  f.each_line.with_index do |line , index|
    line = line.strip
    if index == 0
      @upper_right_co_ordinates = ExtractInput.new(line, 1).upper_right_co_ordinates
      new_rover_intake_status = 'getPositionHeading'
    elsif new_rover_intake_status == 'getPositionHeading'
      get_new_rover_position_heading(line)
      new_rover_intake_status = 'getControlInstructions'
    elsif new_rover_intake_status == 'getControlInstructions'
      get_control_instructions(line)
      land_new_rover
      new_rover_intake_status = 'getPositionHeading'
    end
      
  end
end

execute_control_instructions_for_all_rovers
# PRINT RESULTS 
@rovers.each.with_index do |rover, index|
  puts "#{rover.position[X]} #{rover.position[Y]} #{rover.heading}"
  # LOOP THROUGH ERROR LOG IF IT EXISTS
  unless rover.errors.empty?
    puts "**ERROR LOG for rover index #{index}"
    rover.errors.each do |error|
      puts "|Time: #{error[:timestamp]} | description: #{error[:description]} |"
    end
  end
end








