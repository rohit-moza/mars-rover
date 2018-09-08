class ExtractInput
INDEX_OF_HEADING_ON_LINE = 2

  def initialize(line, line_number)
    @line = line
    @line_number = line_number
  end

  def upper_right_co_ordinates
    split.map{|chr| chr.to_i}
  end

  def initial_position
    split[0..INDEX_OF_HEADING_ON_LINE - 1].map{|chr| chr.to_i}
  end

  def initial_heading
    split[INDEX_OF_HEADING_ON_LINE]
  end

  def split 
    @line.split(' ', @line_number + 1)
  end
  
end