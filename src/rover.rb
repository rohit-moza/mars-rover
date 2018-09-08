class Rover
attr_reader :position, :heading, :control_instructions, :errors
attr_writer :position, :heading, :errors

  def initialize (position, heading, control_instructions)
    @position = position
    @heading  = heading
    @control_instructions = control_instructions
    @errors = []
  end

end