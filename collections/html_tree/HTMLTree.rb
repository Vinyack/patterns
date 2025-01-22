require_relative 'tag'

class HTMLTree
  include Enumerable # Подмешиваем Enumerable

  attr_reader :root

  def initialize(html_string)
    @root = parse_html(html_string)
  end

  # Метод обхода в ширину (BFS)
  def each_bfs(&block)
    return unless @root

    queue = [@root] # Используем очередь
    until queue.empty?
      current = queue.shift
      block.call(current)
      queue.concat(current.children) # Добавляем детей в очередь
    end
  end

  # метод для обхода в глубину , реализация each для Enumerable
  def each(&block)
    return unless @root

    stack = [@root] # используем стек
    until stack.empty?
      current = stack.pop
      block.call(current)
      stack.concat(current.children.reverse) # добавляем детей в стек
    end
  end

  # парсер HTML (упрощенный)
  def parse_html(html_string)
    html_string = html_string.strip
    tag_match = html_string.match(/<(\w+)(.*?)>/)
    return nil unless tag_match

    tag_name = tag_match[1]
    attributes = parse_attributes(tag_match[2])
    closing_tag = "</#{tag_name}>"
    content_start = tag_match.end(0)
    content_end = html_string.index(closing_tag)

    if content_end
      content = html_string[content_start...content_end].strip
      children = extract_children(content)
      tag = Tag.new(tag_name, attributes)
      children.each { |child| tag.add_child(parse_html(child)) }
      tag
    else
      Tag.new(tag_name, attributes)
    end
  end

  # парсер атрибутов тега
  def parse_attributes(attr_string)
    attributes = {}
    attr_string.scan(/(\w+)="(.*?)"/).each do |key, value|
      attributes[key] = value
    end
    attributes
  end

  # извлечение дочерних элементов из содержимого тега
  def extract_children(content)
    children = []
    while (child_match = content.match(/<\w+.*?>.*?<\/\w+>/))
      children << child_match[0]
      content = content[child_match.end(0)..-1]
    end
    children
  end

  # Обход в ширину для метода to_s (по желанию)
  def to_s
    result = []
    each_bfs { |node| result << node.to_s }
    result.join("\n")
  end
end
