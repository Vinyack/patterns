# ЗАДАНИЕ 4
require 'prime'  # Подключаем модуль для работы с простыми числами (для 3-го метода)
# ВАРИАНТ 6
# МЕТОД 1
def sum_of_non_prime_divisors
  print "Введите число: "
  number = gets.to_i
  # проверка, является ли число простым
  sum = (1..number).select { |i| number % i == 0 && (i <= 1 || (2..Math.sqrt(i)).any? { |d| i % d == 0 }) }.sum
  puts "Сумма непростых делителей числа #{number} равна #{sum}"
end
sum_of_non_prime_divisors
# МЕТОД 2
def count_digits_less_than_3(number)
  # преобразуем число в строку, а затем в массив цифр
  digits = number.to_s.chars
  # подсчитываем цифры, которые меньше 3
  digits.count { |digit| digit.to_i < 3 }
end
print "Введите число: "
number = gets.chomp.to_i
puts "Количество цифр меньше 3: #{count_digits_less_than_3(number)}"
# МЕТОД 3
require 'prime'  # Подключаем модуль для работы с простыми числами
# алгоритм Евклида
def gcd(a, b)
  # Используем цикл для нахождения НОД
  while b != 0
    a, b = b, a % b  # Присваиваем a значение b, а b — остаток от деления a на b
  end
  return a
end
# функция для вычисления суммы простых цифр числа
def prime_digit_sum(number)
  digits = number.digits  # Разбиваем число на массив его цифр
  sum = 0  # Переменная для хранения суммы простых цифр

  # проходим по каждой цифре числа
  for digit in digits
    # проверяем, является ли цифра простой
    if Prime.prime?(digit)
      sum += digit  # если цифра простая, добавляем её к сумме
    end
  end

  return sum  # Возвращаем итоговую сумму простых цифр
end
# функция для решения задачи
def solve(num)
  prime_sum = prime_digit_sum(num)  # Вычисляем сумму простых цифр числа

  count = 0  # Переменная для подсчёта подходящих чисел

  # Проходим по всем числам от 1 до num-1 и проверяем условия
  for i in 1...num
    if (num % i != 0) && (gcd(num, i) != 1) && (gcd(prime_sum, i) == 1)
      count += 1  # Если все условия выполнены, увеличиваем счётчик
    end
  end

  return count
end
puts "Введите число: "
number = gets.to_i
result = solve(number)
puts "Результат: #{result}"
