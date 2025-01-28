class MyClass
  def my_attribute=(new_value)
   @my_attribute = new_value
  end
  def my_attribute
    @my_attribute
  end
  end
  my_instance = MyClass.new
  my_instance.my_attribute = "assigned via method call"
  puts my_instance.my_attribute
  my_instance.my_attribute=("same here")
  puts my_instance.my_attribute
# Сеттер - присваивает значение значение перемменной экземпляра.
# Геттер - получает сохраненное ранее значение.