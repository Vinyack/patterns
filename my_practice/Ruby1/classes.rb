# #class Dog
# #  def talk(name)
#     puts "#{name} says Bark!"
#   end
#   def move(name, destination)
#     puts "#{name} running to the #{destination}."
#   end
# end
# # Создание новых экземпляров
# #fido = Dog.new
# #rex = Dog.new
# # Вызов методов
# #fido.talk
# #rex.move("food bowl")
# class Bird
#   def talk(name)
#     puts "#{name} says chirp!"
#   end
#   def move(name, destination)
#     puts "#{name} flying to the #{destination}."
#   end
# end
# class Cat
#   def talk(name)
#     puts "#{name} says Meow!"
#   end
#   def move(name, destination)
#     puts "#{name}running to the #{destination}."
#   end
# end
# bird = Bird.new
# dog = Dog.new
# cat = Cat.new
# bird.move("tree")
# bird.talk
# cat_name = "Elya"
# cat.talk(cat_name)
# cat.move(cat_name, "house")
# dog_name = "Lucy"
# dog.talk(dog_name)
# dog.move(dog_name, "fence")
class Dog
  def make_up_name
    @name = "Sandy"
  end
  def
    talk "#{@name} says Bark!"
  end
  def move(destination)
    puts "#{@name} runs to the #{destination}."
  end
  def make_up_age
    @age = 5
  end
  def report_age
    puts "#{@name} is #{@age} years old."
  end
end
dog = Dog.new
dog.make_up_name
dog.move("yard")
dog.make_up_age
dog.report_age