class Student
  # Определяем геттеры и сеттеры для всех полей
  attr_accessor :id, :phone, :telegram, :email, :git
  attr_reader :last_name, :first_name, :middle_name

  # Конструктор, использующий хеш параметров
  def initialize(params = {})
    @id = params[:id]
    self.last_name = params[:last_name]
    self.first_name = params[:first_name]
    self.middle_name = params[:middle_name]
    self.phone = params[:phone]
    self.telegram = params[:telegram]
    self.email = params[:email]
    self.git = params[:git]
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
