#Подключаем класс студентов из отдельного файла
require_relative 'student'
require_relative 'person'
require_relative 'student_short'
# Создание экземпляров класса
student_example = Student.new(
	id: 1,
	last_name: "Дерябин",
	first_name: "Андрей",
	middle_name: "Викторович", 
	phone: 89621231212,
	telegram: "@vinyack",
	git: "github.com/vinyack"
	)
student_me = Student.new(
	id: 2,
	last_name: "Пшеничнов",
	first_name: "Андрей",
	middle_name: "Александрович", 
	email: "pshen@gmail.com",
	git: "github.com/littleblb"
	)
student_valya = Student.new(
	id: 3,
	last_name: "Дука",
	first_name: "Виталий",
	middle_name: "Андреевич", 
	phone: 88001231231 ,
	telegram: "@sdnezz"
	)
#Вызываем метод вывода информации об объекте класса на экран
puts student_example
#Изменяем контакты, только обращаясь к методу объекта класса для них
student_example.set_contacts(phone: 89998887766, email: "new_email@example.com")
puts student_example
#Проверяем наличие гита и контактов
student_example.validate_git_and_contact

#Выводим гит,инициалы и контакты через отдельные методы объекта класса

puts student_example.short_name
puts student_example.short_info
puts student_example.contact_info

#Выводим краткую информацию через метод объекта класса
puts student_example.get_info

#Создаем объект класса с краткой информацией, передавая туда уже созданный объект другого класса
student_example_short = StudentShort.new_from_student(student_example)
puts student_example_short
student_example_short_2 = StudentShort.new_from_string(id: 2, str: "Иванов И.И.; github.com/ivan; ivan@example.com")
puts student_example_short_2