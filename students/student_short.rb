require_relative 'person'

class StudentShort < Person
  attr_reader :git, :contact

  # Конструктор, принимающий объект Student
  def self.new_from_student(student)
    new(
      id: student.id,
      last_name: student.last_name,
      first_name: student.first_name,
      middle_name: student.middle_name,
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

    last_name, initials = last_name_initials.split
    first_name, middle_name = initials.split('.').map { |i| i + '.' }

    new(id: id, last_name: last_name, first_name: first_name[0], middle_name: middle_name[0], git: git, contact: contact)
  end

  def initialize(id:, last_name:, first_name:, middle_name:, git:, contact:)
    super(id: id, last_name: last_name, first_name: first_name, middle_name: middle_name)
    @git = git
    @contact = contact
  end

  # Метод для строкового представления
  def to_s
    "ID: #{@id}, Фамилия и инициалы: #{short_name}, Git: #{@git}, Контакт: #{@contact}"
  end
end
