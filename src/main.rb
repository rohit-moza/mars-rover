require_relative "./rover"
require_relative "./extract_input"

plateau_bounds                 = gets
initial_rover_position_heading = gets

puts "plateau_bounds are #{plateau_bounds}"
puts "initial rover position and heading is #{initial_rover_position_heading}"

def 

initial_rover_position_heading_split = initial_rover_position_heading.split(' ', 3)

initial_rover_position = initial_rover_position_heading_split[0..1]
initial_rover_heading  = initial_rover_position_heading_split[2] 


puts "initial rover position is #{initial_rover_position}"
puts "initial rover heading is #{initial_rover_heading}"