class Person
  attr_reader :id, :middle_name, :first_name, :surname, :git

  def initialize(middle_name:, first_name:, surname:, git: nil, id: nil)
    self.middle_name = middle_name
    self.first_name = first_name
    self.surname = surname
    self.git = git if git
    self.id = id if id
  end

  # Сеттеры с учётом валидации
  def id=(value)
    raise ArgumentError, "Неверный ID: #{value}" unless Person.id_valid?(value)
    @id = value
  end

  private def middle_name=(name)
    if Person.name_valid?(name)
      @middle_name = name
    else
      raise ArgumentError, "Фамилия должна содержать только буквы: #{name}"
    end
  end

  private def first_name=(name)
    if Person.name_valid?(name)
      @first_name = name
    else
      raise ArgumentError, "Имя должно содержать только буквы: #{name}"
    end
  end

  private def surname=(name)
    if Person.name_valid?(name)
      @surname = name
    else
      raise ArgumentError, "Отчество должно содержать только буквы: #{name}"
    end
  end
  
  # Проверка на наличие гита
  
  def git_present?
    !@git.nil? && !@git.strip.empty?
  end
  
  def git=(git)
    if git.nil? || Person.git_valid?(git)
      @git = git
    else
      raise ArgumentError, "Некорректная ссылка на GitHub: #{git}"
    end
  end
  
  # Абстрактные методы
  
  def contact 
    raise NotImplementedError, 'Метод contact должен быть реализован в подклассе Student'
  end
  
  def contact_present?
    raise NotImplementedError, 'Метод contact_present? должен быть реализован в подклассе Student'
  end

  def contact_and_git_present?
    raise NotImplementedError, 'Метод contact_and_git_present? должен быть реализован в подклассе Student'
  end
  
  #
  
  def short_name
    "#{@surname} #{@name}.#{@middle_name}."
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

end