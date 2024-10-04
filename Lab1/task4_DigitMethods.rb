# ЗАДАНИЕ 4

# МЕТОД 1: Сумма непростых делителей числа
def sum_of_non_prime_divisors(number)
  divisors = (1..number).select do |i|
    number % i == 0 && !prime?(i)
  end
  divisors.sum
end

def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n)).none? { |d| n % d == 0 }
end

def method_1
  print "Введите число: "
  number = gets.to_i
  sum = sum_of_non_prime_divisors(number)
  puts "Сумма непростых делителей числа #{number} равна #{sum}"
end

# МЕТОД 2: Подсчёт цифр, меньших 3
def count_digits_less_than_3(number)
  number.digits.count { |digit| digit < 3 }
end

def method_2
  print "Введите число: "
  number = gets.to_i
  count = count_digits_less_than_3(number)
  puts "Количество цифр меньше 3: #{count}"
end

# МЕТОД 3: Вычисление по условиям
def gcd(a, b)
  b == 0 ? a : gcd(b, a % b)
end

def prime_digit_sum(number)
  number.digits.select { |digit| prime?(digit) }.sum
end

def solve(num)
  prime_sum = prime_digit_sum(num)
  (1...num).count do |i|
    num % i != 0 && gcd(num, i) != 1 && gcd(prime_sum, i) == 1
  end
end

def method_3
  print "Введите число: "
  number = gets.to_i
  result = solve(number)
  puts "Результат: #{result}"
end

# Основная программа для вызова методов
def main
  puts "Выберите метод для выполнения (1, 2 или 3):"
  choice = gets.chomp.to_i

  case choice
  when 1
    method_1
  when 2
    method_2
  when 3
    method_3
  else
    puts "Неверный выбор. Попробуйте снова."
  end
end

main
