require_relative "../../src/execute_control_instructions"
require_relative "../../src/rover"
require "byebug"


new_rover = Rover.new([1, 2], "N", "LMLMLMLMM") 

RSpec.describe "ExecuteControlInstructions", :type => :request do

  describe "given a current heading of N and rotation direction of L" do

    it "should change rover heading to W" do
      expect(ExecuteControlInstructions.change_heading("N", "L")).to eq("W")
    end

  end

  describe "given a current heading of N and rotation direction of R" do
     
    it "should change rover heading to E" do
      expect(ExecuteControlInstructions.change_heading("N", "R")).to eq("E")
    end

  end

  describe "given a current heading of E and rotation direction of L" do
    
    it "should change rover heading to N" do
      expect(ExecuteControlInstructions.change_heading("E", "L")).to eq("N")
    end

  end

  describe "given a current heading of E and rotation direction of R" do
   
    it "should change rover heading to S" do
      expect(ExecuteControlInstructions.change_heading("E", "R")).to eq("S")
    end

  end

  describe "given a current heading of S and rotation direction of L" do
    
    it "should change rover heading to E" do
      expect(ExecuteControlInstructions.change_heading("S", "L")).to eq("E")
    end

  end

  describe "given a current heading of S and rotation direction of R" do
    
    it "should change rover heading to W" do
      expect(ExecuteControlInstructions.change_heading("S", "R")).to eq("W")
    end

  end

  describe "given a current heading of W and rotation direction of L" do
    
    it "should change rover heading to S" do
      expect(ExecuteControlInstructions.change_heading("W", "L")).to eq("S")
    end

  end

  describe "given a current heading of W and rotation direction of R" do
    
    it "should change rover heading to N" do
      expect(ExecuteControlInstructions.change_heading("W", "R")).to eq("N")
    end

  end

  # describe "given instruction of L and a current heading of N" do
   
  #   it "should change rover heading to W" do
  #     expect(ExtractInput.new("5 5" , 1).upper_right_co_ordinates).to eq([5, 5])
  #   end

  # end

  # describe "given instruction of L and a current heading of N" do
   
  #   it "should change rover heading to W" do
  #     expect(ExtractInput.new("5 5" , 1).upper_right_co_ordinates).to eq([5, 5])
  #   end

  # end

end