require 'prime'
# Функция для нахождения наибольшего общего делителя (НОД)
def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  return a
end

# Функция для вычисления суммы простых цифр числа
def prime_digit_sum(number)
  # Если число отрицательное, преобразуем его в положительное
  number = number.abs
  
  digits = number.digits
  sum = 0
  for digit in digits
    if Prime.prime?(digit)
      sum += digit
    end
  end
  return sum
end

# Функция для решения задачи
def solve(num)
  prime_sum = prime_digit_sum(num)
  count = 0
  for i in 1...num
    if (num % i != 0) && (gcd(num, i) != 1) && (gcd(prime_sum, i) == 1)
      count += 1
    end
  end
  return count
end

# Функция для выполнения заданного метода
def perform_task(method, numbers)
  case method
  when 'gcd'
    result = gcd(numbers[0], numbers[1])
  when 'prime_digit_sum'
    result = prime_digit_sum(numbers[0])
  when 'solve'
    result = solve(numbers[0])
  else
    puts "Неизвестный метод: #{method}"
    return
  end
  puts "Результат: #{result}"
end

# Чтение данных из файла
def read_numbers_from_file(filename)
  numbers = []
  File.open(filename, "r") do |file|
    file.each_line do |line|
      numbers << line.to_i
    end
  end
  return numbers
end

# Основная программа
if ARGV.length != 2
  puts "Использование: ruby script.rb <method> <filename>"
  exit
end

method = ARGV[0]  # Первый аргумент — метод
filename = ARGV[1]  # Второй аргумент — имя файла

numbers = read_numbers_from_file(filename)  # Чтение чисел из файла
perform_task(method, numbers)  # Выполнение выбранного метода
