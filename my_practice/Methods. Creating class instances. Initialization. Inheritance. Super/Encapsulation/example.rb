class MyClass
  def public_method
    puts "Public method"
  end

  protected
  def protected_method
    puts "Protected method"
  end

  private
  def private_method
    puts "Private method"
  end
end

obj = MyClass.new
obj.public_method  # Работает
obj.protected_method  # Ошибка (NoMethodError)
obj.private_method  # Ошибка (NoMethodError)