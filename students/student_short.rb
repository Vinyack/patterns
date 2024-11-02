class StudentShort
    attr_reader :id, :last_name_initials, :git, :contact
  
    # Конструктор, принимающий объект Student
    def self.new_from_student(student)
      new(
        id: student.id,
        last_name_initials: "#{student.last_name} #{student.first_name[0]}.#{student.middle_name[0]}.",
        git: student.git,
        contact: student.contact_info
      )
    end
  
    # Конструктор, принимающий ID и строку с информацией
    def self.new_from_string(id, str)
      data = str.split('; ')
      last_name_initials = data[0]
      git = data[1]
      contact = data[2]
  
      new(id: id, last_name_initials: last_name_initials, git: git, contact: contact)
    end
  
    # Инициализация значений
    def initialize(id:, last_name_initials:, git:, contact:)
      @id = id
      @last_name_initials = last_name_initials
      @git = git
      @contact = contact
    end
  
    # Метод для строкового представления
    def to_s
      "ID: #{@id}, Фамилия и инициалы: #{@last_name_initials}, Git: #{@git}, Контакт: #{@contact}"
    end
  end
  