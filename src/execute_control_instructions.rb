module ExecuteControlInstructions

  HEADING_COMBINATION_RESULTS = {
    "NL": "W",
    "NR": "E",
    "EL": "N",
    "ER": "S",
    "SL": "E",
    "SR": "W",
    "WL": "S",
    "WR": "N",
  } 

  def ExecuteControlInstructions.change_heading(initial_heading, rotation_direction) 
    HEADING_COMBINATION_RESULTS["#{initial_heading}#{rotation_direction}".to_sym]
  end


end 