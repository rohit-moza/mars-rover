require_relative "../../src/get_new_heading_position"
require_relative "../../src/rover"
require "byebug"


new_rover = Rover.new([1, 2], "N", "LMLMLMLMM") 

RSpec.describe "getNewHeadingPosition", :type => :request do

  describe "given a current heading of N and rotation direction of L" do

    it "should change rover heading to W" do
      expect(GetNewHeadingPosition.get_new_heading("N", "L")).to eq("W")
    end

  end

  describe "given a current heading of N and rotation direction of R" do
     
    it "should change rover heading to E" do
      expect(GetNewHeadingPosition.get_new_heading("N", "R")).to eq("E")
    end

  end

  describe "given a current heading of E and rotation direction of L" do
    
    it "should change rover heading to N" do
      expect(GetNewHeadingPosition.get_new_heading("E", "L")).to eq("N")
    end

  end

  describe "given a current heading of E and rotation direction of R" do
   
    it "should change rover heading to S" do
      expect(GetNewHeadingPosition.get_new_heading("E", "R")).to eq("S")
    end

  end

  describe "given a current heading of S and rotation direction of L" do
    
    it "should change rover heading to E" do
      expect(GetNewHeadingPosition.get_new_heading("S", "L")).to eq("E")
    end

  end

  describe "given a current heading of S and rotation direction of R" do
    
    it "should change rover heading to W" do
      expect(GetNewHeadingPosition.get_new_heading("S", "R")).to eq("W")
    end

  end

  describe "given a current heading of W and rotation direction of L" do
    
    it "should change rover heading to S" do
      expect(GetNewHeadingPosition.get_new_heading("W", "L")).to eq("S")
    end

  end

  describe "given a current heading of W and rotation direction of R" do
    
    it "should change rover heading to N" do
      expect(GetNewHeadingPosition.get_new_heading("W", "R")).to eq("N")
    end

  end

  describe "given the current heading as N and position as [0, 0]" do
    
    it "should return new rover position as [0, 1]" do
      expect(GetNewHeadingPosition.get_new_position("N", [0,0])).to eq([0,1])
    end

  end

  describe "given the current heading as E and position as [0, 0]" do
    
    it "should return new rover position as [1, 0]" do
      expect(GetNewHeadingPosition.get_new_position("E", [0,0])).to eq([1,0])
    end

  end

  describe "given the current heading as S and position as [0, 1]" do
    
    it "should return new rover position as [0, 0]" do
      expect(GetNewHeadingPosition.get_new_position("S", [0,1])).to eq([0,0])
    end

  end

  describe "given the current heading as W and position as [1, 0]" do
    
    it "should return new rover position as [0, 0]" do
      expect(GetNewHeadingPosition.get_new_position("W", [1,0])).to eq([0,0])
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