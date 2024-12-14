<<<<<<< HEAD
require_relative 'person'
class StudentShort < Person
  # Конструктор для инициализации объекта
  def initialize(id:, git:, contact:, last_name_initials:)
    @id = id
    @git = git
    @contact = contact
    @last_name_initials = last_name_initials
  end

  # Метод для создания объекта на основе объекта student
  def self.new_from_student(student)
    self.new(
      id: student.id,
      git: student.git,
      contact: student.contact,
      last_name_initials: student.short_name
    )
  end

  # Метод для создания объекта на основе строки
  def self.new_from_string(id:, str:)
    student_short_init =   {}
    
    params = split_str_params(str)
    student_short_init[:id] = id
    student_short_init[:last_name_initials] = params[0]  # Инициалы из строки
    student_short_init[:git] = params[1]
    student_short_init[:contact] = params[2..].join(' ')  # Остальные контакты

    self.new(**student_short_init)
  end

  def self.split_str_params(str)
    str.split('; ')  # Разделяем строку по символу ";" c пробелом
  end
  # Закрываем метод new
  private_class_method  :new

  # Переопределение метода to_s
  def to_s
    str = []
    str << "ID: #{@id}" if @id
    str << "Фамилия И.О.: #{@last_name_initials}"
    str << "GitHub: #{@git}" if @git
    str << "#{@contact}" if @contact
    str.join("; ")
  end
end
=======
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
  
>>>>>>> 9db67e35fb4949dc4da1f200fe6308297f4a42dd
