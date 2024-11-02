class Student
    # Определяем геттеры и сеттеры для всех полей
    attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :git
    
    def initialize(params = {})
      # Используем метод установки каждого поля для применения валидации и стандартных значений
      @id = params[:id]
      self.last_name = params[:last_name]
      self.first_name = params[:first_name]
      self.middle_name = params[:middle_name]
      self.phone = params[:phone]
      self.telegram = params[:telegram]
      self.email = params[:email]
      self.git = params[:git]
    end
  
    # Валидация ФИО
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
      raise ArgumentError, "#{field} не может быть пустым" if value.nil? || value.strip.empty?
      value
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
  end
  