require_relative "./rover"
require_relative "./extract_input"
require 'pp'
require 'byebug'
require_relative './get_new_heading_position'
require_relative './constants'

@rovers = []
@rover_count = 0 
@error_landings = []

def print_outputs 
 
  @rovers.each.with_index do |rover, index|
    puts "#{rover.position[X]} #{rover.position[Y]} #{rover.heading}"

    unless rover.errors.empty?
      puts "**ERROR LOG*** for rover on line above with index #{index}"
      rover.errors.each do |error|
        puts "|Error Time: #{error[:timestamp]} | description: #{error[:description]} |"
      end
    end
  end

  unless @error_landings.empty?
    puts "**FATAL ERROR LOG*** LANDING ERRORS"
      @error_landings.each do |error|
      puts "|Error Time: #{error[:timestamp]} | description: #{error[:description]} |"
    end
  end

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

def will_not_collide_with_other_rovers_on_move_or_land(new_position_requested, rover)
  will_not_collide = true
  @rovers.each do |other_rover|
    unless rover == other_rover
      if rover.position == other_rover.position
        will_not_collide = false
      end
    end
  end
  will_not_collide
end

def allowed_to_change_position(new_position_requested, rover, instruction)
  allowed_to_change_position = false
  x_constraint_met = dimension_constraint_met(X, new_position_requested)
  y_constraint_met = dimension_constraint_met(Y, new_position_requested)
  dimension_constraint_met = x_constraint_met && y_constraint_met 
  if dimension_constraint_met && will_not_collide_with_other_rovers_on_move_or_land(new_position_requested, rover)
    allowed_to_change_position = true
  elsif !dimension_constraint_met
    rover.errors << {timestamp: Time.now, description: "tried to move out of X-Y bounds with instruction: #{instruction}, Current Position At Error Time: #{rover.position}, Invalid New Position Requested: #{new_position_requested}"}
    allowed_to_change_position = false
  else 
    rover.errors << {timestamp: Time.now, description: "Collission sensor activated rover not allowed to move into another rover: #{instruction}, Current Position At Error Time: #{rover.position}, Invalid New Position Requested: #{new_position_requested}"}
    allowed_to_change_position =false
  end
  allowed_to_change_position
end

def execute_control_instructions_for_rover
  rover = @rovers[@rover_count]
  rover.control_instructions.each_char {|instruction|
    if /M/.match(instruction)  
      new_position_requested = GetNewHeadingPosition.get_new_position(rover.heading, rover.position)
      if allowed_to_change_position(new_position_requested, rover, instruction)
        rover.position = new_position_requested
      end
    elsif /(L|R)/.match(instruction)
      rover.heading = GetNewHeadingPosition.get_new_heading(rover.heading, instruction)
    else
      rover.errors << {timestamp: Time.now, description: "tried to execute invalid control instruction: #{instruction}"}
    end
  }
end


def land_new_rover
  new_rover = Rover.new(@initial_rover_position, @initial_rover_heading, @rover_control_instructions)
 
  if will_not_collide_with_other_rovers_on_move_or_land(new_rover.position, new_rover)
    @rovers[@rover_count] = new_rover
    execute_control_instructions_for_rover
    @rover_count +=1
  else 
    @error_landings << {timestamp: Time.now, description: "Rover landing denied. A rover already lives at this location, cannot land on another rover. Rover attempted to land at this position: #{new_rover.position}"}
  end
end

def read_and_load_rovers
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
end

read_and_load_rovers
print_outputs