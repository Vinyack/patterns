require_relative 'person'
class Student_short

attr_reader :contact, :short_name

private_class_method :new

	def initialize(id:, git:, contact:, short_name:)
		@id = id
		@git = git
		@contact = contact
		@short_name = short_name
	end
  
	def self.from_student(student)
		new(
			id: student.id,
			git: student.git,
			short_name: student.short_name,
			contact: student.contact_info
		)
	end
	
	# Метод для создания объекта на основе строки
	
	def self.split_str_params(str)
		str.split('; ')
	end
	
	def self.from_string(id:, str:)
		init = {}
		parametrs = split_str_params(str)
		init[:id] = id
		init[:short_name] = parametrs[0]
		init[:git] = parametrs[1]
		init[:contact] = parametrs[2..].join(' ')
		self.new(**init)
	end
	
	def to_s
		str = []
		str << "ID: #{@id}" if @id
		str << "Фамилия И.О.: #{@short_name}"
		str << "GitHub: #{@git}" if @git
		str << "#{@contact}" if @contact
		str.join("; ")
	end
end
