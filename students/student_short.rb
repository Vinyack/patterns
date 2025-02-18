require_relative 'person'

class StudentShort < Person
  attr_reader :contact

  private_class_method :new

  private def initialize(id:, git:, contact:, short_name:)
    super(id: id, git: git)
    @contact = contact
    @short_name = short_name
  end

  def self.from_student(student)
    new(
      id: student.id,
      git: student.git,
      short_name: student.short_name,
      contact: student.phone || student.tg || student.email
    )
  end

  def self.split_str_params(str)
    str.split('; ')
  end

  def self.from_string(id:, str:)
    init = {}
    parametrs = split_str_params(str)
    init[:id] = id
    init[:short_name] = parametrs[0] || ''
    init[:git] = parametrs[1] || ''
    init[:contact] = parametrs[2..]&.join(' ') || ''
    self.new(**init)
  end

  def to_s
    "#{@id} #{@short_name} #{@git} #{@contact}"
  end

end
