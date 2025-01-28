class Animal
    attr_reader :name, :age
    def name=(value)
        if value == ""
            raise "error"
        else @name = value
        end
    end
    def age=(value)
        if value < 0
            raise "error cant be <"
        else @age = value
        end
    end
    def report_age
        puts "dear #{@name} is #{@age} years old."
    end
    def move(destination)
        puts "#{@name} running to #{destination}"
    end
    def talk
        puts "says smthg"
    end
end