class Person
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def <=>(other)
    age <=> other.age
  end
end

people = [Person.new(30), Person.new(20)]
people.sort  # Сортировка по возрасту