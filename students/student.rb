class student
    attr_accessor :id, :last_name, :name, :otchestvo, :tg, :mail, :git
    attr_reader :number
    # Создаём метод класса для проверки номера
    def self.valid_number?(number)
        number.is_a?(String) && number.match?(/\A\+d{11}\z/)
    # Конструктор, вызывается автоматически при создании объекта с помощью ClassName.new, его задача инициализировать объект и задать начальные значения для его переменных экземпляра.
    def initialize(id: 1, last_name:, name:,number:nil,tg:nil,mail:nil,git:nil)
        @id = id
        @last_name=last_name
        @name=name
        @otchestvo=otchestvo
        @number=number
        @tg=tg
        @mail=mail
        @git=git
    end
    
    # Сеттер для номера телефона, с проверкой формата

    def number=(number)
        if phone.nil? || student.valid_number?(number)
        @number=number
        else
            raise "Неверный формат номера: #{phone} должен быть в формате +12345678910"
        end
    end

    def to_s
        info = "ID: #{@id}\n"
        info += "Фамилия #{@last_name}\n"
        info += "Имя #{@name}\n"
        info += "Отчество #{@otchestvo }\n"
        info += "Номер #{@number || 'Не указано'}\n"
        info += "Телеграм #{@tg || 'Не указано'}\n"
        info += "Почта #{@mail || 'Не указано'}\n"
        info += "Гит #{@git || 'Не указано'}\n"
        info
end