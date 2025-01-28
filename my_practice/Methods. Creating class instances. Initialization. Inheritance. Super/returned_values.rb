def mileage (miles_driven, gas_used)
    if gas_used == 0
      return 0.0
    end
    miles_driven / gas_used # return возвращает значение последнего выражения, вычисленного в методе.
end
trip_mileage = mileage(400, 12)
puts "U got #{trip_mileage} MPG on this trip."
lifetime_mileage = mileage (11432, 366)
puts "This  car averages #{lifetime_mileage} MPG."
