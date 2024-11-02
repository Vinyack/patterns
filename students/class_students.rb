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
    # Метод для отображения информации об объекте
    def to_s
      info = "ID: #{@id}\nФамилия: #{@last_name}\nИмя: #{@first_name}\nОтчество: #{@middle_name}\n"
      info += "Телефон: #{@phone}\n" if @phone
      info += "Telegram: #{@telegram}\n" if @telegram
      info += "Email: #{@email}\n" if @email
      info += "GitHub: #{@git}\n" if @git
      info
    end
  end
  