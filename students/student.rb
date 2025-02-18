require_relative 'person'
require 'date'

class Student
include Comparable
attr_reader :phone, :email, :tg, :birthdate

	def initialize(second_name:, first_name:, surname:, id: nil, email: nil, phone: nil, git: nil, tg: nil)
		self.birthdate = birthdate if birthdate
		set_contacts(phone: phone, email: email, tg: tg)
		super(git: git, id: id, contact: contact)
	end
	
	def birthdate=(birthdate)
		@birthdate = Date.parse(birthdate)
	end
	
	def <=>(other)
		if self.birthdate < other.birthdate
			return -1
		elsif self.birthdate == other.birthdate
			return 0
		else
			return 1
		end
	end

	def set_contacts(email, phone, tg)
		self.email = email if email
		self.phone = phone if phone
		self.tg = tg if tg
		self.contact = contact_info
	end
	
	def get_initials_and_contact
    		"#{initials_name}; GitHub: #{@git}; Контакт: #{get_contact}"
  	end
	
	def get_contact
		"#{phone || tg || email}"
		
	def contact_present?
    		[@phone, @telegram, @email].any? { |contact| contact && !contact.strip.empty? }
  	end
	
	def has_git?
		!!@git
	end
	
	def validate
		has_any_contact? && has_git?
	end
	
	def self.phone_valid?(phone)
		phone.to_s.match?(/^(\d{11}|\+\d{11})$/)
	end
	
	def self.email_valid?(email)
		email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
	end
	
	def self.tg_valid?(tg)
		tg.match?(/\A@[\w\d_]{5,32}\z/)
	end
	
  	def phone=(value)
    		raise ArgumentError, 'Некорректный номер телефона' unless self.class.phone_valid?(value)
    		@phone = value
  	end

 	def telegram=(value)
    		raise ArgumentError, 'Некорректный Telegram' unless self.class.telegram_valid?(value)
    		@telegram = value
  	end

  	def email=(value)
    		raise ArgumentError, 'Некорректный email' unless self.class.email_valid?(value)
    		@email = value
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
