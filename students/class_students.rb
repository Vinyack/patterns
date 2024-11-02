class Student
    # Определяем геттеры и сеттеры для каждого поля
    attr_accessor :id, :last_name, :first_name, :middle_name, :phone, :telegram, :email, :git
  
    # Конструктор класса
    def initialize(id: nil, last_name:, first_name:, middle_name:, phone: nil, telegram: nil, email: nil, git: nil)
      @id = id
      @last_name = last_name
      @first_name = first_name
      @middle_name = middle_name
      @phone = phone
      @telegram = telegram
      @email = email
      @git = git
    end
    # Метод для форматированного вывода информации об объекте
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