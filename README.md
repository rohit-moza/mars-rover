# Mars-Rover

## INSTRUCTIONS TO TEST 
* `cd src`
* modify `input.txt` - This is where you can load all the input lines for the program
* To run main program `ruby main.rb`
* rspec files are in `spec/features/`
  - To test type `rspec spec/features/TEST_SPEC_FILE_NAME` 
* Note: Ruby 2.5.0 used
* Errors for each rover will be shown below the individual rover output result with relevant error info.
* Rover landing errors will be shown seperately at the end of the output with relevant error info.

## PROBLEM BREAKDOWN
* Heading 
  - direction rover is facing i.e. 'N', 'S', 'E', 'W'
  - string

* Rover 
  - position/ location [x,y] + heading
  - x, y = ints

* Operator Commands 
  - L - 90deg L       ----> These change the heading
  - R - 90 deg R    ----> These change the heading
  - M - Move forward one grid point   ---> move relative to heading

* L and R / Previous Heading to New Heading
  - N + L -> W
  - N + R -> E

  - E + L -> N 
  - E + R -> S

  - S + L -> E
  - S + R -> W

  - W + L -> S
  - W + R -> N

* Heading and Movement
  - N : (x,y) -> (x,y+1)
  - S : (x,y) -> (x,y-1)
  - E : (x,y) -> (x+1,y)
  - W: (x,y) -> (x-1,y)


## INPUT
* Load Input via input.txt file
* Initially Tested via command line input
* LINE 1 = Bounds of Grid e.g. 5,5 means we are bound between 0,0 to 5,5 
* LINE 2 = Rover initial Position
* LINE3 = String / char array with commands to execute sequentially

## OUTPUT
* Final Rover position/location and heading e.g. 1 3 N

## ADDITIONAL CONSIDERATIONS AND ASSUMPTIONS
- Grid boundaries i.e. Rover will not advance for command that makes it exceed boundaries
- Rover collisions Prevention - Rover will not advance for command that forces it to collide with another Rover. 
- Rover will not be allowed to land (take initial position) if another Rover occupies that position

## EXTENSIONS CONSIDERED FOR FUTURE IMPROVEMENTS
- Advanced Rover Collission Prevention Comms. Rovers will communicate with each other and only if allowed and give way to each other if permitted to know about each other's next commands
- Give way can include moving out of the way temporarily and then returning back to position
- GUI
