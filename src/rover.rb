class Rover

  def initialize (position, heading, control_instructions)
    @position = position
    @heading  = heading
    @rover_control_instructions = control_instructions
  end

  def position
    @position
  end

  def heading
    @heading
  end

  def control_instructions
    @control_instructions
  end

end