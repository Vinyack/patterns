require_relative 'person'
class Student < Person
  attr_reader :phone, :telegram, :email
  # Конструктор для студента
  def initialize(id: nil, first_name:, last_name:, middle_name:, git: nil, phone: nil, telegram: nil, email: nil)
    set_contacts(phone: phone, telegram: telegram, email: email)
    super(first_name: first_name, last_name: last_name, middle_name: middle_name, git: git, id: id, contact: contact_info)
  end
<<<<<<< HEAD
=======

  # Сеттер с валидацией для Telegram
  private def telegram=(telegram)
    raise "Неверный формат Telegram" unless Person.valid_telegram?(telegram)
    @telegram = telegram
  end

  # Сеттер с валидацией для Email
  private def email=(email)
    raise "Неверный формат Email" unless Person.valid_email?(email)
    @email = email
  end

  # Сеттер с валидацией для GitHub
  def github=(github)
    raise "Неверный формат GitHub" unless Person.valid_github?(github)
    @github = github
  end

  # Метод для получения фамилии и инициалов
  def short_name
    initials = "#{@first_name[0].upcase}."
    initials += "#{@middle_name[0].upcase}." if @middle_name
    "#{@last_name} #{initials}"
  end

  # Метод для получения основного контакта
  def primary_contact
    if @phone
      "Телефон: #{@phone}"
    elsif @telegram
      "Telegram: #{@telegram}"
    elsif @email
      "Email: #{@email}"
    else
      nil
    end
  end

  # Метод для получения GitHub
  def git_info
    @github
  end
  
    def to_s
      str = []
      str << "ID: #{@id}" if @id
      str << "Firstname: #{@first_name}"
      str << "Surname: #{@last_name}"
      str << "Lastname: #{@middle_name}"
      str << "Birthdate: #{@birthdate}"
      str << "Phone: #{@phone}" if phone
      str << "Telegram: #{@telegram}" if telegram
      str << "Email: #{@email}" if email
      str << "GitHub: #{@github}" if github
      str.join('; ')
    end
  # Метод getInfo: возвращает краткую информацию
  def getInfo
    "#{short_name}; #{git_info || 'Нет GitHub'}; #{primary_contact || 'Нет контакта'}"
  end

  # Метод для установки контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    raise "Неверный формат номера телефона" unless phone.nil? || Person.valid_phone?(phone)
    raise "Неверный формат Telegram" unless telegram.nil? || Person.valid_telegram?(telegram)
    raise "Неверный формат Email" unless email.nil? || Person.valid_email?(email)
>>>>>>> 9db67e35fb4949dc4da1f200fe6308297f4a42dd
  
  # Метод для установки контактов через сеттеры
  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone if phone
    self.telegram = telegram if telegram
    self.email = email if email
    self.contact = contact_info
  end

  # Сеттер для phone с валидацией
  private def phone=(value)
    if value.nil? || Student.phone_valid?(value)
      @phone = value
    else
      raise ArgumentError, "Неверный телефон: #{value}"
    end
end


  # Сеттер для telegram с валидацией
 	private def telegram=(value)
	  if value.nil? || Student.telegram_valid?(value)
	    @telegram = value
	  else
	    raise ArgumentError, "Неверный Telegram:"
	  end
	end

  private def email=(value)
	  if email.nil? || Student.email_valid?(value)
	    @email = value
	  else
	    raise ArgumentError, "Неверный адрес электронной почты:"
	  end
	end


  def self.phone_valid?(phone)
    phone.to_s.match?(/^(\d{11}|\+\d{11})$/)
  end

  # Валидация телеги
  def self.telegram_valid?(telegram)
    telegram.match?(/^@[\w]+$/)
  end

  # Валидация электронной почты
  def self.email_valid?(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  # Метод получения любого доступного контакта
	def contact_info
	  if @phone
	    "Телефон: #{@phone}"
	  elsif @telegram
	    "Телеграм: #{@telegram}"
	  elsif @email
	    "Почта: #{@email}"
	  else
	    nil
	  end
	end

  def get_info
    "#{short_name}; Гит: #{git_info}; #{@contact}"
  end

  def to_s
    str = []
    str << super
    str << "Номер телефона: #{@phone}" if @phone
    str << "Телеграм: #{@telegram}" if @telegram
    str << "Почта: #{@email}" if @email
    str.join("; ")
  end

  # Метод для создания краткой информации о студенте
  def short_info
    "id: #{@id}; Фамилия: #{@firstname}; Имя: #{@last_name}; Отчество: #{@middle_name}; git: #{@git}; #{@contact}"
  end
end