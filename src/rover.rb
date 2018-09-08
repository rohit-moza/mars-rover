class Rover
attr_reader :position, :heading, :control_instructions
attr_writer :position, :heading

  def initialize (position, heading, control_instructions)
    @position = position
    @heading  = heading
    @control_instructions = control_instructions
  end

end