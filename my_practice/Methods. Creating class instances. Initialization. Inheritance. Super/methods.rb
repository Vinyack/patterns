# чтобы вывести все методы для объекта => puts object.methods, где объект это число или строка
# Определение методов
def print_sum (arg1, arg2)
    print arg1 + arg2
end
def accelerate
    puts "Stepping on the gas"
    puts "Speeding up"
end
def sound_horn
    puts "Pressing the horn button"
    puts "Beep beep!"
end
def use_headlights(brightness = "low-beam")
    puts "Turning on #{brightness} headlights"
    puts "Watch out for deer!"
end
sound_horn
accelerate
use_headlights("50%")
def print_area(length, width)
    pust length*width
end
# Необязательные параметры

def order_soda(flavor, size = "medium", quantity = 1) # Для необязательных параметров, надо ставить значения по умолчанию
    if quantity == 1
        plural = "soda"
    else plural == "sodas"
    end
    puts "#{quantity} #{size} #{flavor} #{plural}, coming right up!"
end
# Чтобы заменить значение необязательного параметра, нужно передать аргумент с нужным значение.

order_soda("orange")
order_soda("lemon-lime", "small", 2) # Задаются все параметры
order_soda("grape", "large") # Задаются параметры flavor и size