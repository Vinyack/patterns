require_relative 'Person'
# class Friend < Person
#     def greeting
#         basic_greeting = super
#         "#{basic_greeting} Glad to see you!"
#     end
# end
# puts Friend.new.greeting
class Friend < Person
    def greet_by_name(name)
        basic_greeting = super(name)
        "#{basic_greeting} Glad to see you!"
    end
end
puts Friend.new.greet_by_name("Meghan")
puts BasicObject.superclass