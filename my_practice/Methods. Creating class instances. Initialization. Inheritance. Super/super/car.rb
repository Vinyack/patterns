require_relative 'vehicle'
class Car < Vehicle
end
car = Car.new
car.odometer = 11432
car.gas_used = 366
print "Lifetime MPG: "
puts car.mileage