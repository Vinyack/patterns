class Vehicle
  attr_accessor :odometer, :gas_used
  def accelerate
    puts "Floor it!"
  end
  def sound_horn
    puts "Beep! Beep!"
  end
  def steer
    puts "Turn front 2 wheels."
  end
  def mileage
    @odometer / @gas_used
  end
end