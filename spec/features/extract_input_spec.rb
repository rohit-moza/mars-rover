require_relative "../../src/extract_input"

RSpec.describe "ExtractInput", :type => :request do

  describe "given the first line with upper right co-ordinates" do
   
    it "should return an array with the co-ordinates" do
      expect(ExtractInput.new("5 5" , 1).upper_right_co_ordinates).to   eq([5, 5])
    end

  end

  describe "given the second line with rover initial position and heading" do

    it "should return an array with the rover postion co-ordinates" do
      expect(ExtractInput.new("1 3 N" , 2).initial_position).to   eq([1, 3])
    end

    it "should a string with rover the heading" do
      expect(ExtractInput.new("1 3 N" , 2).initial_heading).to   eq("N")
    end

  end


end