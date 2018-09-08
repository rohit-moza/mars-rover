module GetNewHeadingPosition
  
  X = 0
  Y = 1

  HEADING_ROTATION_COMBINATION_RESULTS = {
    "NL": "W",
    "NR": "E",
    "EL": "N",
    "ER": "S",
    "SL": "E",
    "SR": "W",
    "WL": "S",
    "WR": "N",
  } 

  def GetNewHeadingPosition.get_new_heading(initial_heading, rotation_direction) 
    HEADING_ROTATION_COMBINATION_RESULTS["#{initial_heading}#{rotation_direction}".to_sym]
  end

  def GetNewHeadingPosition.get_new_position(current_heading, current_position) 
  new_position = current_position.dup
    case current_heading
    when "N"
      new_position[Y] += 1
    when "E"
      new_position[X] += 1
    when "S"
      new_position[Y] -= 1
    when "W"
      new_position[X] -= 1
    end
  new_position
  end


end 