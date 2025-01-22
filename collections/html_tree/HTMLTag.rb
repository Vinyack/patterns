class Tag
  attr_reader :name, :attributes, :content, :children

  def initialize(name, attributes = {}, content = nil)
    @name = name
    @attributes = attributes
    @content = content
    @children = [] # Подтеги
  end

  # Метод для добавления дочерних тегов
  def add_child(tag)
    @children << tag
  end

  # Возвращает строку представления тега
  def to_s
    attr_str = @attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
    attr_str = " #{attr_str}" unless attr_str.empty?
    if @children.empty? && @content.nil?
      "<#{@name}#{attr_str} />"
    else
      inner_content = (@children.map(&:to_s).join + (@content || '')).strip
      "<#{@name}#{attr_str}>#{inner_content}</#{@name}>"
    end
  end

  # Возвращает число дочерних тегов
  def child_count
    @children.size
  end

  # Проверяет, есть ли дочерние элементы
  def has_children?
    !@children.empty?
  end
end
