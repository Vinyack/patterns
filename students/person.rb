class Person
    attr_reader :id
  
    def initialize(id:)
      @id = id
      validate_id
    end
  
    # Валидация ID
    def validate_id
      raise "ID должен быть положительным числом" unless id.is_a?(Integer) && id > 0
    end
  
    # Метод для проверки наличия контактов
    def has_any_contact?
      !@telegram.nil? || !@phone.nil? || !@e_mail.nil?
    end
  
    # Метод для проверки наличия GitHub
    def has_git?
      !@github.nil? && !@github.empty?
    end
  
    # Общая валидация для подклассов
    def validate
      raise "GitHub аккаунт обязателен!" unless has_git?
      raise "Необходимо указать хотя бы один контакт для связи!" unless has_any_contact?
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
  end
  