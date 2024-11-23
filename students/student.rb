class Student < Person

  attr_reader :phone, :telegram, :email

  def initialize(id: nil, first_name:, last_name:, middle_name:, github: nil, phone: nil, telegram: nil, email: nil)
    set_contacts(phone: phone, telegram: telegram, email: email)
    super(
      id: id,
      first_name: first_name,
      last_name: last_name,
      middle_name: middle_name,
      github: github,
      contact: primary_contact
    )
  end  

  # Сеттер с валидацией для телефона
  private def phone=(phone)
    raise "Неверный формат номера телефона" unless phone.nil? || Person.valid_phone?(phone)
    @phone = phone
  end

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
  
    @phone = phone
    @telegram = telegram
    @email = email
  end
end
