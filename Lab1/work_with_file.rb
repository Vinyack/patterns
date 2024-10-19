# Функция для нахождения наибольшего общего делителя (НОД)
def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end

# Функция для проверки, является ли число простым
def prime?(number)
  return false if number < 2
  (2..Math.sqrt(number)).none? { |i| number % i == 0 }
end

# Функция для вычисления суммы простых цифр числа
def prime_digit_sum(number)
  number.abs.digits.select { |digit| prime?(digit) }.sum
end

# Функция для решения задачи
def solve(num)
  prime_sum = prime_digit_sum(num)
  (1...num).count do |i|
    num % i != 0 && gcd(num, i) != 1 && gcd(prime_sum, i) == 1
  end
end

# Выполнение задачи на основе переданного метода
def perform_task(method, numbers)
  result =
    case method
    when 'gcd'
      gcd(numbers[0], numbers[1])
    when 'prime_digit_sum'
      prime_digit_sum(numbers[0])
    when 'solve'
      solve(numbers[0])
    else
      puts "Неизвестный метод: #{method}"
      return
    end
  puts "Результат: #{result}"
end

# Чтение чисел из файла
def read_numbers_from_file(filename)
  File.readlines(filename).map(&:to_i)
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
