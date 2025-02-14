module MyModule
  def my_method
    puts "Method from module"
  end
end

class MyClass
  include MyModule
end

obj = MyClass.new
obj.my_method  # "Method from module"