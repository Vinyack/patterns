class Dog
  # def name=(new_value)
  #   @name = new_value
  # end
  # def name
  #   @name
  # end
  # def age=(new_value)
  #   @age = new_value
  # end
  # def age
  #   @age
  # end
#   attr_accessor :name, :age # Тоже самое, что и выше, только кратко
#   def report_age
#     puts "#{@name} is #{@age} years old."
#   end
# end
attr_reader :name, :age
def name=(value)
  if value == ""
    raise "Name can't be blank"
  else @name = value
  end
end
def age=(value)
  if value < 0
    raise "An age of #{value} can't be < zero"
  else @age = value
  end
end
def report_age
  puts "#{name} is #{age} y.o."
end

smily = Dog.new
smily.name = "smily"
smily.age = 7
rex = Dog.new
rex.name = "rex"
rex.age = 10
rex.report_age
smily.report_age