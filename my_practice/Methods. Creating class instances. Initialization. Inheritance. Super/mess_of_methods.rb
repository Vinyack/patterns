def talk(animal_type, name)
  if animal_type == "bird"
    puts "#{name} says Chirp! Chirp!"
  elsif animal_type == dog
    puts "#{name} says bark!"
  elsif animal_type == cat
    puts "#{name} says meow!"
  end
end
def move(animal_type, name, destination)
  if animal_type == "bird"
    puts "#{name} flies to the #{destination}"
  elsif animal_type == "dog"
    puts "#{name} run to the #{destination}"
  elsif animal_type == "cat"
    puts "#{name} run to the #{destination}"
  end
end
def report_age(name, age)
  puts "#{name} is #{age} years old."
end
move("bird", "Kesha", "tree") 
talk("dog", "Jack")
talk("bird", "Whistler")
move("cat", "Kat", "chair")
report_age("Kat", 6)
# Нужны классы, чтобы не передавать миллионы аргументов