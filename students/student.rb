class student
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

    # Геттеры созданные для получения значения полей объекта Student после его создания.
    def id()
        @id
    end

    def last_name()
        @last_name
    end

    def name()
        @name
    end

    def number()
        @number
    end

    def tg()
        @tg
    end

    def mail()
        @mail
    end

    def git()
        @git
    end

    # Сеттеры созданные для изменения значения полез объекта после его создания.
    def id=(value)
        @id=value
    end

    def last_name=(value)
        @last_name=value
    end

    def name=(value)
        @name=value
    end

    def number=(value)
        @number=value
    end

    def tg=(value)
        @tg=value
    end

    def mail=(value)
        @mail=value
    end

    def git=(value)
        @git=value
    end
end