require_relative 'person'
class StudentShort < Person 
    attr_reader :id, :last_name_initials, :github, :contact        
    def initialize(id:, git:, contact:, last_name_initials:)
        @id = id
        @git = git
        @contact = contact
        @last_name_initials = last_name_initials
    end

    # Конструктор из объекта класса Student
    def self.new_from_student(student)
        self.new(
        id: student.id,
        git: student.git,
        contact: student.contact,
        last_name_initials: student.short_name
        )
    end
  # Конструктор из String
    def self.new_from_string(id:, str:)
        student_short_init =   {}
        params = split_str_params(str)
        student_short_init[:id] = id
        student_short_init[:last_name_initials] = params[0]
        student_short_init[:git] = params[1]
        student_short_init[:contact] = params[2..].join(' ')  # Остальные контакты
        self.new(**student_short_init)
    end
    def self.split_str_params(str)
        str.split('; ')  # Разделяем строку по символу ";" c пробелом
    end
    # Закрываем метод new
    private_class_method  :new
    # Переопределение метода и вывод информации
  def to_s
    ["ID: #{@id}", "Фамилия И.О.: #{@last_name_initials}", "GitHub: #{@git}", @contact].compact.join("; ")
  end
end
