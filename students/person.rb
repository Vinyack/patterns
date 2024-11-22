class Person
  attr_reader :id, :first_name, :middle_name, :last_name, :github

  def initialize(id:, last_name:, first_name:, middle_name:, contact: nil, github: nil)
    self.last_name = last_name
    self.first_name = first_name
    self.middle_name = middle_name
    self.contact = contact if contact
    self.id = id if id
    self.github = github if github
  end

  # Валидация ID
  def id=(id)
    raise "ID должен быть положительным числом" unless id.is_a?(Integer) && id > 0
    @id = id
  end

  # Метод для проверки наличия контактов
  def contact?
    !@contact.nil? && !@contact.empty?
  end

  def last_name=(last_name)
    @last_name = last_name if Person.valid_name?(last_name)
  end

  def first_name=(first_name)
    @first_name = first_name if Person.valid_name?(first_name)
  end

  def middle_name=(middle_name)
    @middle_name = middle_name if Person.valid_name?(middle_name)
  end

  # Валидация для имени
  def self.valid_name?(name)
    name.is_a?(String) && name.match?(/\A[а-яА-Яa-zA-Z]+\z/)
  end

  # Сеттер с валидацией для GitHub
  def github=(github)
    raise "Неверный формат GitHub" unless Person.valid_github?(github)
    @github = github
  end

  # Метод для проверки наличия GitHub
  def has_git?
    !@github.nil? && !@github.empty?
  end

  protected def contact=(value)
    @contact = value
  end

  # Общая валидация для подклассов
  def validate
    raise "GitHub аккаунт обязателен!" unless has_git?
    raise "Необходимо указать хотя бы один контакт для связи!" unless contact?
  end

  # Методы класса для проверки форматов
  def self.valid_phone?(phone)
    phone.is_a?(String) && phone.match?(/\A\+\d{11}\z/)
  end

  def self.valid_telegram?(telegram)
    telegram.nil? || (telegram.is_a?(String) && telegram.match?(/\A@[\w]+\z/))
  end

  def self.valid_email?(email)
    email.nil? || (email.is_a?(String) && email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i))
  end

  def self.valid_github?(github)
    github.nil? || (github.is_a?(String) && github.match?(/\Ahttps:\/\/github\.com\/\w+/))
  end

  # Метод для получения инициалов (Фамилия И.О.)
  def short_name
    "#{last_name} #{first_name[0]}.#{middle_name[0]}."
  end

  def to_s
    str = []
    str << "ID: #{id}" if id
    str << "Фамилия: #{last_name}"
    str << "Имя: #{first_name}"
    str << "Отчество: #{middle_name}"
    str << "GitHub: #{github}" if github
    str.join("; ")
  end
end