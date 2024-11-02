require_relative 'student'

# Создание нескольких объектов Student с разными комбинациями полей
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

student2 = Student.new(
  id: 2,
  last_name: "Дука",
  first_name: "Виталий",
  middle_name: "Андреевич",
  email: "duka@gmail.com"
)

student3 = Student.new(
  id: 3,
  last_name: "Пшеничнов",
  first_name: "Андрей",
  middle_name: "Александрович",
  telegram: "@pshenka"
)

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts "-" * 30
student1.display_info
student2.display_info
student3.display_info

# Создание студента через конструктор из строки
student_from_string = Student.from_string(1, "Дерябин А.В.; github.com/vinyack; +79012345678")
puts student_from_string.inspect  # Выводим объект для проверки

# Вывод краткой информации о студенте
puts student_from_string.get_info

# Создание объекта Student
student = Student.from_string(1, "Дерябин А.В.; github.com/vinyack; +79012345678")

# Создание объекта StudentShort из объекта Student
student_short_from_student = StudentShort.new_from_student(student)
puts student_short_from_student.to_s

# Создание объекта StudentShort из строки
student_short_from_string = StudentShort.new_from_string(2, "Дерябин А.В.; github.com/vinyack; deryabin@yandex.ru")
puts student_short_from_string.to_s