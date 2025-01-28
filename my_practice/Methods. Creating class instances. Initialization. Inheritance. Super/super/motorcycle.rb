require_relative 'vehicle'
class Motorcycle < Vehicle
    def steer
        puts "Turn front wheel."
    end
end
motorcycle = Motorcycle.new
motorcycle.steer
