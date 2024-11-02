require_relative 'student'

# Создание нескольких объектов Student с разными комбинациями полей
student1 = Student.new(
  id: 1,
  last_name: "Иванов",
  first_name: "Иван",
  middle_name: "Иванович",
  phone: "+79012345678",
  telegram: "@ivanov",
  email: "ivanov@example.com",
  git: "github.com/ivanov"
)

student2 = Student.new(
  id: 2,
  last_name: "Петров",
  first_name: "Петр",
  middle_name: "Петрович",
  email: "petrov@example.com"
)

student3 = Student.new(
  id: 3,
  last_name: "Сидорова",
  first_name: "Анна",
  middle_name: "Андреевна",
  telegram: "@sidorova"
)

# Вывод информации о каждом студенте
puts "Информация о студентах:"
puts "-" * 30
student1.display_info
student2.display_info
student3.display_info

# Создание студента через конструктор из строки
student_from_string = Student.from_string(1, "Иванов И.И.; github.com/ivanov; +79012345678")
puts student_from_string.inspect  # Выводим объект для проверки
