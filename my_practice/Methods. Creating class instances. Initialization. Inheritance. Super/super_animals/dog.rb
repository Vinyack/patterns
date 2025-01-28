require_relative 'animal'
class Dog < Animal
    def talk
        puts "bark!"
    end
    def to_s
        "#{name} the dog, age #{age}"
    end
end
jessy = Dog.new
jessy.name = "Jessy"
jessy.talk
jessy.age = 5
jessy.report_age
puts jessy.to_s