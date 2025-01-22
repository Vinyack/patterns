require_relative 'html_tree'

html = <<-HTML
<div id="main">
  <h1 class="title">Hello, World!</h1>
  <p>This is a paragraph.</p>
  <div>
    <span>Nested span</span>
  </div>
</div>
HTML

tree = HTMLTree.new(html)
puts tree.to_s # Выводит дерево в строковом представлении

# Работа с экземплярами класса Tag
puts tree.root.name # "div"
puts tree.root.child_count # 3
puts tree.root.children[0].name # "h1"
puts tree.root.children[0].attributes # {"class" => "title"}
puts tree.root.children[1].content # "This is a paragraph."
