class student
    attr_accessor :id, :last_name, :name, :number, :tg, :mail, :git
    # Конструктор, вызывается автоматически при создании объекта с помощью ClassName.new, его задача инициализировать объект и задать начальные значения для его переменных экземпляра.
    def initialize(id: 1, last_name:, name:,number:nil,tg:,mail:,git:)
        @id = id
        @last_name=last_name
        @name=name
        @number=number
        @tg=tg
        @mail=mail
        @git=git
    end
end