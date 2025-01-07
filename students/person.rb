class person

 attr_reader :id, :second_name, :first_name, :surname, :git, :contact
 
   # Конструктор с общими полями для наследников, id, git и contact необязателен
	def initialize(second_name:, first_name:, surname:, git: nil, id: nil, contact: nil)
		self.second_name = second_name
		self.first_name = first_name
		self.surname = surname
		self.git = git if git
		self.id = id if id
		self.contact = contact if contact
	end
	
	# Сеттеры с учётом валидации
	def id=(value)
		raise ArgumentError, "Неверный ID: #{value}" unless Person.id_valid?(value)
		@id = value
	end
	
	def second_name=(name)
		if Person.name_valid?(name)
			@second_name = name
		else
			raise ArgumentError, "Фамилия должна содержать только буквы: #{name}"
		end
	end
	
	def first_name=(name)
		if Person.name_valid?(name)
			@first_name = name
		else
			raise ArgumentError, "Имя должно содержать только буквы: #{name}"
		end
	end
	
	def surname=(name)
		if Person.name_valid?(name)
			@surname = name
		else
			raise ArgumentError, "Отчество должно содержать только буквы: #{name}"
		end
	end
	
	def git=(git)
		if git.nil? || Person.git_valid?(git)
			@git = git
		else
			raise ArgumentError, "Некорректная ссылка на GitHub: #{git}"
		end
	end
	
	def self.id_valid?(id)
		id.to_s.match?(/^\d+$/)
	end

	def self.name_valid?(name)
		name.match?(/\A[а-яА-ЯёЁa-zA-Z]+\z/)
	end
	
	def self.git_valid?(git)
		git.match?(/\Ahttps?:\/\/(www\.)?github\.com\/[\w\-]+(\/[\w\-]+)?\z/)
	end
	
	protected def contact=(value)
		@contact = value
	end

	def short_name
		"#{second_name} #{first_name[0]}.#{surname[0]}."
	end

	def to_s
		str = []
		str << "ID: #{id}" if @id
		str << "Фамилия: #{second_name}"
		str << "Имя: #{first_name}"
		str << "Отчество: #{surname}"
		str << "GitHub: #{git}" if @git
		str.join("; ")
	end
end
