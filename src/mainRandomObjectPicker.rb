require 'pp'

objectList = [
  {'harvey' => 'dog'}, 
  {'jinja' => 'cat'},
  {'jack' => 'rabbit'}
]


class RandomObject
  attr_reader :objectList
  attr_writer :objectList

  def initialize (objectList)
    @objectList = objectList
    @gotObjects = []
    @lastObj = {}
  end

  def getRandomNumber
    # random number
    rand(@objectList.length) 
  end

  def get 
    if @objectList.length == 1
      return @objectList.first
    elsif  @objectList.empty?
      return 'ERROR!!'
    end
    randomNumber = self.getRandomNumber
    returnObj = @objectList[randomNumber]
    # No repeats check
    if @gotObjects.include?(returnObj) || returnObj == @lastObj
      # check again and get new num
      puts 'Oh I have that one looking again'
      if @gotObjects.length == @objectList.length  
        puts 'Oh I have everything refreshing gotObjects...'
        @gotObjects = []
      end
      return self.get
    end
    @gotObjects.push(returnObj)
    @lastObj = returnObj
    returnObj
  end

end

objectListRandom = RandomObject.new(objectList) 

for i in 1..8
  if i == 2
    objectList.pop
  end


  result = objectListRandom.get
  pp result
end

# pp objectListRandom


