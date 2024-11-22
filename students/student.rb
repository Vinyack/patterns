class Student < Person

  attr_reader :phone, :telegram, :email

  def initialize(id: nil, first_name:, last_name:, middle_name:, git: nil, phone: nil, telegram: nil, email: nil)
    set_contacts(phone: phone, telegram: telegram, email: email)
    super(first_name: first_name, last_name: last_name, middle_name: middle_name, git: git, id: id, contact: primary_contact)
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
    @e_mail = email
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
    elsif @e_mail
      "Email: #{@e_mail}"
    else
      nil
    end
  end

  # Метод для получения GitHub
  def git_info
    @github
  end

  # Метод getInfo: возвращает краткую информацию
  def getInfo
    "#{short_name}; #{git_info}; #{primary_contact}"
  end

  # Метод для установки контактов
  def set_contacts(phone: nil, telegram: nil, email: nil)
    self.phone = phone unless phone.nil?
    self.telegram = telegram unless telegram.nil?
    self.email = email unless email.nil?
  end
end
