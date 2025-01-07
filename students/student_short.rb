require_relative 'person'
require_relative 'student'

class Student_short

attr_reader :id, :git, :contact, :short_name

private_class_method :new

	def self.from_student(student)
		new(
			id: student.id,
			git: student.git,
			initials: student.short_name,
			contact: student.contact
		)
	end
	
	# Метод для создания объекта на основе строки
	
	def self.split_str_params(str)
		str.split('; ')  # Разделяем строку по символу ";" c пробелом
	end
	
	def self.from_string(id:, str:)
		init = {}
		parametrs = split_str_parametrs(str)
		init[:id] = id
		init[:short_name] = parametrs[0]
		init[:git] = parametrs[1]
		init[:contact] = parametrs[2..].join(' ')
		self.new(**init)
	end
	
	end
