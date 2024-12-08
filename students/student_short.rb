class StudentShort < Person 
  
    def initialize(id:, last_name_initials:, github:, contact:)
        super(id: id)
        @last_name_initials = last_name_initials
        @github = github
        @contact = contact
    end
  
    # Конструктор из объекта класса Student
    def self.from_student(student)
        raise "Передан не объект класса Student" unless student.is_a?(Student)
  
        new(
            id: student.id,
            last_name_initials: student.short_name,
            github: student.git_info,
            contact: student.primary_contact
        )
    end
  
    # Конструктор из строки
    def self.from_string(id, info_string)
        data = info_string.split(";").map(&:strip)
        raise "Некорректная строка: должно быть 3 части" unless data.size == 3
  
        new(
            id: id,
            last_name_initials: data[0],
            github: data[1],
            contact: data[2]
        )
    end
    # Закрываем метод new
    private_class_method  :new
    # Вывод информации
    def to_s
        "ID: #{@id}, ФИО: #{@last_name_initials}, GitHub: #{@github}, Контакт: #{@contact}"
    end
end
  
