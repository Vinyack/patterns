require_relative 'person'
require 'date'

class Student
include Comparable
attr_reader :phone, :email, :tg, :birthdate

	def initialize(middle_name:, first_name:, surname:, id: nil, email: nil, phone: nil, git: nil, tg: nil)
		self.birthdate = birthdate if birthdate
		set_contacts(phone: phone, email: email, tg: tg)
		super(git: git, id: id)
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

	def set_contacts(phone: nil, email: nil, tg: nil)
		self.email = email if email
		self.phone = phone if phone
		self.tg = tg if tg
	end
	
	def short_name_and_contact
    		"#{short_name}; GitHub: #{@git}; Контакт: #{contact}"
  	end
	
	def contact
		"#{phone || tg || email}"
	end
	
	def git_present?
		@git && !@git.strip.empty?
	end
	
	def contact_present?
    		[@phone, @tg, @email].any? { |contact| contact && !contact.strip.empty? }
  	end
	
	def contact_and_git_present?
		git_present? || contact_present?
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

 	def tg=(value)
    		raise ArgumentError, 'Некорректный Telegram' unless self.class.tg_valid?(value)
    		@tg = value
  	end

  	def email=(value)
    		raise ArgumentError, 'Некорректный email' unless self.class.email_valid?(value)
    		@email = value
	end
		
	def to_s
		"#{@id} #{@surname} #{@first_name} #{@middle_name}\nGit: #{@git}\nДанные для связи:\nНомер телефона: #{@phone}\nТелеграм: #{@tg}\nEmail: #{@email}\n"
	end
	
	def surname=(value)
		@surname=(value)
	end

	def middle_name=(value)
		@middle_name = value
	end

	def first_name=(value)
		@first_name = value
	end
 end
