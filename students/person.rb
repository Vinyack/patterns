class Person
    attr_accessor :id
    attr_reader :last_name, :first_name, :middle_name
  
    # Конструктор для общих полей
    def initialize(id: nil, last_name:, first_name:, middle_name:)
      @id = id
      self.last_name = last_name
      self.first_name = first_name
      self.middle_name = middle_name
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
  
    # Метод для получения ФИО в формате "Фамилия И.О."
    def short_name
      "#{last_name} #{first_name[0]}.#{middle_name[0]}."
    end
  end
  