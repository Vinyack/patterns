class Student
  # Определяем геттеры и сеттеры для всех полей
  attr_accessor :id, :telegram, :email, :git
  attr_reader :last_name, :first_name, :middle_name, :phone

  # Конструктор с именованными аргументами
  def initialize(id: nil, last_name:, first_name:, middle_name:, phone: nil, telegram: nil, email: nil, git: nil)
    @id = id
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
    @contacts_frozen = false
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

  # Валидация обязательных полей ФИО
  def last_name=(value)
    @last_name = validate_presence(:last_name, value)
  end

  def first_name=(value)
    @first_name = validate_presence(:first_name, value)
  end

  def middle_name=(value)
    @middle_name = validate_presence(:middle_name, value)
  end

  # Метод для проверки наличия значения для обязательных полей
  def validate_presence(field, value)
    raise ArgumentError, "#{field.capitalize} не может быть пустым" if value.nil? || value.strip.empty?
    value
  end

  # Валидация и установка необязательных полей
  def phone=(value)
    raise "Невозможно изменить контакты" if contacts_frozen?
    @phone = value.nil? || Student.valid_phone?(value) ? value : raise(ArgumentError, "Неверный формат телефона")
  end

  def telegram=(value)
    raise "Невозможно изменить контакты" if contacts_frozen?
    @telegram = value.nil? || valid_telegram?(value) ? value : raise(ArgumentError, "Неверный формат Telegram")
  end

  def email=(value)
    raise "Невозможно изменить контакты" if contacts_frozen?
    @email = value.nil? || valid_email?(value) ? value : raise(ArgumentError, "Неверный формат email")
  end

  def git=(value)
    @git = value.nil? || valid_git?(value) ? value : raise(ArgumentError, "Неверный формат GitHub")
  end

  # Методы проверки форматов
  def self.valid_phone?(phone)
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

  # Метод validate для проверки наличия гита и хотя бы одного контакта
  def validate
    if git.nil? || (phone.nil? && telegram.nil? && email.nil?)
      raise "Ошибка: у студента должен быть либо GitHub, либо хотя бы один контактный метод"
    end
  end

  # Метод set_contacts для установки контактов и заморозки их значений
  def set_contacts(phone: nil, telegram: nil, email: nil)
    @phone = phone if phone && Student.valid_phone?(phone)
    @telegram = telegram if telegram && valid_telegram?(telegram)
    @email = email if email && valid_email?(email)
    
    @contacts_frozen = true
    freeze_contacts
  end

  private

  def freeze_contacts
    @phone.freeze if @phone
    @telegram.freeze if @telegram
    @email.freeze if @email
  end

  def contacts_frozen?
    @contacts_frozen
  end

  # Метод для отображения информации об объекте
  def display_info
    puts "ID: #{@id || 'не указан'}"
    puts "Фамилия: #{@last_name}"
    puts "Имя: #{@first_name}"
    puts "Отчество: #{@middle_name}"
    puts "Телефон: #{@phone || 'не указан'}"
    puts "Telegram: #{@telegram || 'не указан'}"
    puts "Email: #{@email || 'не указан'}"
    puts "GitHub: #{@git || 'не указан'}"
    puts "-" * 30
  end

  # Метод to_s для строкового представления объекта
  def to_s
    "ID: #{@id || 'не указан'}, ФИО: #{@last_name} #{@first_name[0]}. #{@middle_name[0]}.," \
    " Телефон: #{@phone || 'не указан'}, Telegram: #{@telegram || 'не указан'}," \
    " Email: #{@email || 'не указан'}, GitHub: #{@git || 'не указан'}"
  end
end
