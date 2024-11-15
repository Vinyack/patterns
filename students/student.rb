class student
    attr_accessor :id, :last_name, :name, :otchestvo, :telegram, :email, :github
    attr_reader :phone, :id

    # Создаём метод класса для проверки номера

    # Валидация

    def self.valid_number?(phone)
        phone.is_a?(String) && phone.match?(/\A\+d{11}\z/)
    end

    def self.valid_id?(id)
        id.is_a?(Integer) && id > 0
    end

    def self.valid_name?(name)
        name.is_a?(String) && name.match?(/\A[а-яА-Яa-zA-Z]+\z/)
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

    # Конструктор, вызывается автоматически при создании объекта с помощью ClassName.new, его задача инициализировать объект и задать начальные значения для его переменных экземпляра.

    def initialize(id: 1, last_name:, name:,phone:nil,telegram:nil,email:nil,git:nil)
        self.id = id
        self.last_name = last_name
        self.first_name = first_name
        self.middle_name = middle_name
        self.phone = phone
        self.telegram = telegram
        self.email = email
        self.github = github
    end

    # set_contacts

    def set_contacts(telegram: nil, email:nil, phone:nil)
        if phone && !Student.valid_phone?(phone)
            raise "Неверный формат номера телефона"
        end
      
        if telegram && !Student.valid_telegram?(telegram)
            raise "Неверный формат Telegram"
        end
      
        if email && !Student.valid_email?(email)
            raise "Неверный формат Email"
        end
          @phone = phone unless phone.nil?
          @telegram = telegram unless telegram.nil?
          @email = email unless email.nil?
    end


    # Сеттеры с валидацией

    def id=(id)
        raise "ID должен быть положительным числом" unless Student.valid_id?(id)
        @id = id
    end

    def last_name=(last_name)
        aise "Фамилия должна содержать только буквы" unless Student.valid_name?(last_name)
        @last_name = last_name
    end

    def first_name=(first_name)
        raise "Имя должно содержать только буквы" unless Student.valid_name?(first_name)
        @first_name = first_name
    end

    def middle_name=(middle_name)
        if middle_name && !Student.valid_name?(middle_name)
            raise "Отчество должно содержать только буквы или быть пустым"
        end
        @middle_name = middle_name
    end

    def github=(github)
        raise "GitHub должен начинаться с https://github.com/" unless Student.valid_github?(github)
        @github = github
    end
    
    def has_any_contact?
        !@telegram.nil? || !@phone.nil? || !@email.nil?
    end
    
    def has_git?
        !@github.nil? || !@github.empty?
    end

    # Валидация для проверки наличия гита и любого контакта для связи

    def validate
        raise "Github аккаунт обязателен!" unless has_git?
        raise "Контакты для связи - необходимы!" unless has_any_contact?
        true
    end

    def to_s
        info = "ID: #{@id}\n"
        info += "Фамилия #{@last_name}\n"
        info += "Имя #{@name}\n"
        info += "Отчество #{@middle_name}\n"
        info += "Номер #{@phone || 'Не указано'}\n"
        info += "Телеграм #{@telegram || 'Не указано'}\n"
        info += "Почта #{@email || 'Не указано'}\n"
        info += "Гит #{@git || 'Не указано'}\n"
        info
    end
end