require_relative 'animal'
class Bird < Animal
    def move
        super
    end
    def talk
        puts "#{name} chirk!"
    end
end
sinitza = Bird.new
sinitza.name = "gosha"
sinitza.talk