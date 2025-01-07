class Student

attr_reader :phone, :email, :tg
attr_accessor :id

	def initialize(second_name, first_name, last_name, id: nil, email: nil, phone: nil, git: nil, tg: nil)
		self.second_name = second_name
		self.first_name = first_name
		self.last_name = last_name
		@id = id
		self.git = git
		set_contacts(phone: phone, email: email, tg: tg)
	end
	
	# Краткая информация о студенте

	def get_info
		"#{short_name}; Гит: #{git || 'Не указан'}; Связь: #{contact_info}"
	end

	# Метод для получения ФИО с инициалами
	
	def short_name
		"#{second_name} #{first_name[0]}.#{last_name[0]}."
	end
	
	# Методы для возврата отдельных значений
	
	def get_git
		git || "Гит не указан"
	end

	def get_contact
		contact_info
	end

	def get_short_name
		short_name
	end
	
	# Конструктор строки
	
	def self.from_string(data)
		# Парсим строку, разделяя её по запятой
		parts = data.split(",").map(&:strip)
		# Убедимся, что есть минимум 3 обязательных поля (ФИО)
		raise ArgumentError, "Недостаточно данных для создания объекта Student" if parts.size < 3
		# Вызываем стандартный конструктор с парсингом полей
		self.new(
			second_name: parts[0],
			first_name: parts[1],
			last_name: parts[2],
			phone: parts[3],
			email: parts[4],
			git: parts[5],
			tg: parts[6]
			)
		rescue IndexError
		raise ArgumentError, "Неверный формат строки: #{data}"
	end
	
	def display_info
		puts "ID: #{@id || 'Не задан'}"
		puts "Фамилия: #{@second_name}"
		puts "Имя: #{@first_name}"
		puts "Отчество: #{@last_name}"
		puts "Почта: #{@email || 'Не задан'}"
		puts "Телефон: #{@phone || 'Не задан'}"
		puts "Гитхаб: #{@git || 'Не задан'}"
		puts "Телеграм: #{@tg || 'Не задан'}"
	end

	def has_any_contact?
		!!(@phone || @email || @tg)
	end
	
	def contact
		return phone if phone
		return email if email
		return tg if tg
	end
	
	def has_git?
		!!@git
	end
	
	def validate
		raise "Должен быть указан хотя бы один контакт для связи" unless has_any_contact?
		raise "Отсутствует ссылка на GitHub" unless has_git?
		true
	end
	
	def set_contacts(email, phone, tg)
		self.email = email if email
		self.phone = phone if phone
		self.tg = tg if tg
	end
	
	# Валидация полей
	
	def self.phone_valid?(phone)
		phone.to_s.match?(/^(\d{11}|\+\d{11})$/)
	end
	
	def self.name_valid?(name)
		name.match?(/\A[а-яА-ЯёЁa-zA-Z]+\z/)
	end
	
	def self.email_valid?(email)
		email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
	end
	
	def self.git_valid?(git)
		git.match?(/\Ahttps?:\/\/(www\.)?github\.com\/[\w\-]+(\/[\w\-]+)?\z/)
	end
	
	def self.tg_valid?(tg)
		tg.match?(/\A@[\w\d_]{5,32}\z/)
	end
	
	# Сеттеры с учётом валидации
	
	def second_name=(name)
		if Student.name_valid?(name)
			@second_name = name
		else
			raise ArgumentError, "Фамилия должна содержать только буквы: #{name}"
		end
	end
	
	def first_name=(name)
		if Student.name_valid?(name)
			@first_name = name
		else
			raise ArgumentError, "Имя должно содержать только буквы: #{name}"
		end
	end
	
	def last_name=(name)
		if Student.name_valid?(name)
			@last_name = name
		else
			raise ArgumentError, "Отчество должно содержать только буквы: #{name}"
		end
	end
	
	private def email=(email)
		if email.nil? || Student.email_valid?(email)
			@email = email
		else
			raise ArgumentError, "Некорректный email: #{email}"
		end
	end
	
	def git=(git)
		if git.nil? || Student.git_valid?(git)
			@git = git
		else
			raise ArgumentError, "Некорректная ссылка на GitHub: #{git}"
		end
	end
	
	private def phone=(phone)
		if phone.nil? || Student.phone_valid?(phone)
			@phone = phone
		else
			raise ArgumentError, "Некорректный номер телефона: #{phone}"
		end
	end
	
	private def tg=(tg)
		if tg.nil? || Student.tg_valid?(tg)
			@tg = tg
		else
			raise ArgumentError, "Некорректное имя пользователя Telegram: #{tg}"
		end
	end
 end
