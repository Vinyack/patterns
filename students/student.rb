class student
    attr_accessor :id, :last_name, :name, :number, :tg, :mail, :git
    # Конструктор, вызывается автоматически при создании объекта с помощью ClassName.new, его задача инициализировать объект и задать начальные значения для его переменных экземпляра.
    def initialize(id: 1, last_name:, name:,number:nil,tg:nil,mail:nil,git:nil)
        @id = id
        @last_name=last_name
        @name=name
        @number=number
        @tg=tg
        @mail=mail
        @git=git
    end
    def to_s
        info = "ID: #{@id}\n"
        info += "Фамилия #{@last_name}\n"
        info += "Имя #{@name}\n"
        info += "Отчество #{@otchestvo}\n"
        info += "Номер #{@number}\n"
        info += "Телеграм #{@tg}\n"
        info += "Почта #{@mail}\n"
        info += "Гит #{@git}\n"
        info
end