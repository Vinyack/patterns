require_relative 'person'

class Student < Person
  attr_accessor :telegram, :email, :git
  attr_reader :phone

  def initialize(id: nil, last_name:, first_name:, middle_name:, phone: nil, telegram: nil, email: nil, git: nil)
    super(id: id, last_name: last_name, first_name: first_name, middle_name: middle_name)
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  # Дополнительный конструктор, принимающий строку
  def self.from_string(id, str)
    data = str.split('; ')
    last_name, initials = data[0].split
    first_name, middle_name = initials.split('.').map { |i| i + '.' }
    git = data[1]
    contact = data[2]

    contact_data = parse_contact(contact)

    self.new(
      id: id,
      last_name: last_name,
      first_name: first_name[0],
      middle_name: middle_name[0],
      git: git,
      **contact_data
    )
  end

  # Вспомогательный метод для разбора контакта
  def self.parse_contact(contact_str)
    case contact_str
    when /@/ then { telegram: contact_str }
    when /\A\+?\d{10,15}\z/ then { phone: contact_str }
    when /@.+\./ then { email: contact_str }
    else
      {}
    end
  end

  # Метод для валидации и установки контактов
  def phone=(value)
    @phone = value.nil? || valid_phone?(value) ? value : raise(ArgumentError, "Неверный формат телефона")
  end

  def telegram=(value)
    @telegram = value.nil? || valid_telegram?(value) ? value : raise(ArgumentError, "Неверный формат Telegram")
  end

  def email=(value)
    @email = value.nil? || valid_email?(value) ? value : raise(ArgumentError, "Неверный формат email")
  end

  def git=(value)
    @git = value.nil? || valid_git?(value) ? value : raise(ArgumentError, "Неверный формат GitHub")
  end

  # Методы проверки форматов
  def valid_phone?(phone)
    phone.match?(/^\+?\d{10,15}$/)
  end

  def valid_telegram?(telegram)
    telegram.match?(/^@\w+$/)
  end

  def valid_email?(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def valid_git?(git)
    git.match?(/^github\.com\/[\w.-]+$/)
  end

  # Метод для получения краткой информации о студенте
  def get_info
    "#{short_name}; Git: #{git || 'не указан'}; Контакт: #{contact_info || 'не указан'}"
  end

  # Метод для получения доступного контакта
  def contact_info
    phone || telegram || email
  end
end
