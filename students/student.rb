require_relative 'person'

class Student

attr_reader :phone, :email, :tg

	def initialize(second_name:, first_name:, surname:, id: nil, email: nil, phone: nil, git: nil, tg: nil)
		@id = id
		set_contacts(phone: phone, email: email, tg: tg)
		super(second_name: second_name, first_name: first_name, surname: surname, git: git, id: id, contact: contact)
	end
	
	# Краткая информация о студенте

	def contact_info
	  if @phone
	    "Телефон: #{@phone}"
	  elsif @tg
	    "Телеграм: #{@tg}"
	  elsif @email
	    "Почта: #{@email}"
	  else
	    nil
	  end
	end
	
	def set_contacts(email, phone, tg)
		self.email = email if email
		self.phone = phone if phone
		self.tg = tg if tg
		self.contact = contact_info
	end
	
	def has_any_contact?
		!!(@phone || @email || @tg)
	end
	
	def has_git?
		!!@git
	end
	
	def validate
		has_any_contact? && has_git?
	end

	# Валидация полей
	
	def self.phone_valid?(phone)
		phone.to_s.match?(/^(\d{11}|\+\d{11})$/)
	end
	
	def self.email_valid?(email)
		email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
	end
	
	def self.tg_valid?(tg)
		tg.match?(/\A@[\w\d_]{5,32}\z/)
	end
	
	private def email=(email)
		if email.nil? || Student.email_valid?(email)
			@email = email
		else
			raise ArgumentError, "Некорректный email: #{email}"
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
	
	def to_s
		str = []
		str << super
		str << "Номер телефона: #{phone}" if phone
		str << "Почта: #{email}" if email
		str << "Телеграм: #{tg}" if tg
		str.join("; ")
	end
 end
