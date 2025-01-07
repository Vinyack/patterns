require_relative 'student'

student1 = Student.new(
  "Дерябин",
  "Андрей",
  "Викторович",
  phone: "+79999999999",
  tg: "@vinyack",
  email: "vinyackofficial@gmail.com"
)

student2 = Student.new(
  "Дерябин",
  "Андрей",
  "Викторович",
  tg: "@vinyack123",
  email: "vinyackofficial123@gmail.com"
)

student1.display_info
student2.display_info

# Пример строки с полными данными
data1 = "Иванов, Иван, Иванович, +79991234567, ivanov@example.com, https://github.com/ivanov, @ivanov"
student3 = Student.from_string(data1)

# Пример строки с минимальными данными (только ФИО)
data2 = "Петров, Петр, Петрович"
student4 = Student.from_string(data2)

# Пример строки с частичными данными
data3 = "Сидоров, Сидор, Сидорович, +79998887766, sid@mail.com"
student5 = Student.from_string(data3)

# Вывод информации о студентах
puts "Информация о студенте 1:"
student3.display_info
puts

puts "Информация о студенте 2:"
student4.display_info
puts

puts "Информация о студенте 3:"
student5.display_info
