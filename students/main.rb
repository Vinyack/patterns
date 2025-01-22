# Подключаем классы из отдельных файлов
require_relative 'student'
require_relative 'person'
require_relative 'student_short'
require_relative 'binary_tree'

# Создаём несколько экземпляров класса `Student` с разными комбинациями необязательных полей
student1 = Student.new(
  id: 1,
  second_name: "Дерябин",
  first_name: "Андрей",
  surname: "Викторович",
  phone: "+79999999999",
  tg: "@vinyack",
  git: "https://github.com/vinyack"
)

student2 = Student.new(
  id: 2,
  second_name: "Дука",
  first_name: "Виталий",
  surname: "Андреевич",
  email: "twinknezz@gmail.com",
  git: "https://github.com/sdnezz"
)

student3 = Student.new(
  id: 3,
  second_name: "Андрей",
  first_name: "Андрей",
  surname: "Андреич",
  phone: "+77777777777",
  tg: "@andrei"
)

# Выводим полную информацию о студентах
puts "Информация о студенте 1:"
puts student1

puts "Информация о студенте 2:"
puts student2

puts "Информация о студенте 3:"
puts student3

# Изменяем контакты у студента 1
student1.set_contacts(phone: "+89998887766", email: "new_email@example.com")
puts "Информация о студенте 1 после изменения контактов:"
puts student1

# Проверяем наличие гита и контактов
  student1.validate

# Выводим сокращённую информацию через методы
puts "Сокращённая информация о студенте 1:"
puts "Фамилия и инициалы: #{student1.short_name}"
puts "Краткая информация: #{student1.get_info}"
puts "Контактная информация: #{student1.contact_info}"

# Создаём объект класса `StudentShort` на основе уже созданного объекта `Student`
student_short1 = StudentShort.from_student(student1)
puts "Краткая информация (StudentShort) о студенте 1:"
puts student_short1

# Создаём объект `StudentShort` из строки
student_short2 = StudentShort.from_string(id: 4, str: "Дерябин А.В.; https://github.com/vinyack; vinyack@gmail.com")
puts "Краткая информация (StudentShort) о студенте 2 из строки:"
puts student_short2

# Создаем бинарное сортированное дерево
tree = BinarySortedTree.new(students)

# Итерация по дереву
puts tree