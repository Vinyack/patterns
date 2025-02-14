class Person
  attr_reader :id, :second_name, :first_name, :surname, :git, :contact

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

  # Метод для получения контактной информации
  def contact_info
    @contact
  end

  # Метод для установки контактов
  def set_contacts(phone: nil, email: nil, tg: nil)
    self.phone = phone if phone
    self.email = email if email
    self.tg = tg if tg
    self.contact = [phone, email, tg].compact.join(', ')
  end

  # Валидация полей
  def self.id_valid?(id)
    id.to_s.match?(/^\d+$/)
  end

  def self.name_valid?(name)
    name.match?(/\A[а-яА-ЯёЁa-zA-Z]+\z/)
  end

  def self.git_valid?(git)
    git.match?(/\Ahttps?:\/\/(www\.)?github\.com\/[\w\-]+(\/[\w\-]+)?\z/)
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

  protected

  def contact=(value)
    @contact = value
  end

  def phone=(phone)
    if phone.nil? || Person.phone_valid?(phone)
      @phone = phone
    else
      raise ArgumentError, "Некорректный номер телефона: #{phone}"
    end
  end

  def email=(email)
    if email.nil? || Person.email_valid?(email)
      @email = email
    else
      raise ArgumentError, "Некорректный email: #{email}"
    end
  end

  def tg=(tg)
    if tg.nil? || Person.tg_valid?(tg)
      @tg = tg
    else
      raise ArgumentError, "Некорректное имя пользователя Telegram: #{tg}"
    end
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
    str << "Контакт: #{contact}" if @contact
    str.join("; ")
  end
end