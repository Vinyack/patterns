require_relative 'person'
require_relative 'student'
require_relative 'student_short'

# Создание объекта Student с полными контактными данными
student1 = Student.new(
  id: 1,
  last_name: "Дерябин",
  first_name: "Андрей",
  middle_name: "Викторович",
  phone: "+79012345678",
  telegram: "@vinyack",
  email: "vinyackofficial@gmail.com",
  git: "github.com/vinyack"
)

puts "Полная информация о студенте (student1):"
student1.display_info

# Создание объекта Student с частичными контактными данными (только email)
student2 = Student.new(
  id: 2,
  last_name: "Дука",
  first_name: "Виталий",
  middle_name: "Андреевич",
  email: "duka@gmail.com"
)

puts "\nКраткая информация о студенте (student2):"
puts student2.get_info

# Создание объекта Student с частичными контактными данными (только Telegram)
student3 = Student.new(
  id: 3,
  last_name: "Пшеничнов",
  first_name: "Андрей",
  middle_name: "Александрович",
  telegram: "@pshenka"
)

puts "\nКраткая информация о студенте (student3):"
puts student3.get_info

# Создание объекта StudentShort из объекта Student (student1)
student_short1 = StudentShort.new_from_student(student1)
puts "\nИнформация о сокращённом объекте StudentShort (student_short1) из student1:"
puts student_short1.to_s

# Создание объекта StudentShort из объекта Student (student2)
student_short2 = StudentShort.new_from_student(student2)
puts "\nИнформация о сокращённом объекте StudentShort (student_short2) из student2:"
puts student_short2.to_s

# Создание объекта StudentShort из объекта Student (student3)
student_short3 = StudentShort.new_from_student(student3)
puts "\nИнформация о сокращённом объекте StudentShort (student_short3) из student3:"
puts student_short3.to_s

# Проверка валидации контактов у объекта Student
begin
  student4 = Student.new(
    id: 4,
    last_name: "Кузнецов",
    first_name: "Пётр",
    middle_name: "Сергеевич",
    git: nil
  )
  # Валидация на наличие Git и хотя бы одного контакта
  student4.validate
rescue => e
  puts "\nОшибка валидации у student4:"
  puts e.message
end

# Установка контактов через метод set_contacts для student1
student1.set_contacts(phone: "+79991234567", email: "new_email@example.com")
puts "\nКонтакты student1 после вызова set_contacts:"
student1.display_info

# Попытка изменения контакта после вызова set_contacts
begin
  student1.phone = "+70000000000"
rescue => e
  puts "\nОшибка при попытке изменения контактов у student1 после set_contacts:"
  puts e.message
end
