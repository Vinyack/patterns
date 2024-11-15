# Подключаем классы
require_relative 'person'
require_relative 'student'
require_relative 'student_short'

# Основная функция
def main
  begin
    # Создание объекта Student
    student = Student.new(
      id: 1,
      last_name: "Иванов",
      first_name: "Иван",
      middle_name: "Иванович",
      phone: "+79123456789",
      telegram: "@ivanov",
      email: "ivanov@example.com",
      github: "https://github.com/ivanov"
    )

    # Вывод информации о студенте
    puts "Информация о студенте:"
    puts student.getInfo
    puts

    # Изменение контактов
    student.set_contacts(phone: "+79211234567", email: "new_email@example.com")
    puts "Информация о студенте после изменения контактов:"
    puts student.getInfo
    puts

    # Создание объекта StudentShort из Student
    student_short = StudentShort.from_student(student)
    puts "Информация о кратком объекте StudentShort:"
    puts student_short
    puts

    # Создание объекта StudentShort из строки
    info_string = "Иванов И.И.; https://github.com/ivanov; Телефон: +79211234567"
    student_short_from_string = StudentShort.from_string(2, info_string)
    puts "Информация о кратком объекте StudentShort из строки:"
    puts student_short_from_string
    puts

  rescue StandardError => e
    puts "Ошибка: #{e.message}"
  end
end

# Вызов метода main
main
