# ЗАДАНИЕ 4
# ВАРИАНТ 6
# МЕТОД 1
def sum_of_non_prime_divisors
  print "Введите число: "
  number = gets.to_i
  # Проверка, является ли число простым
  sum = (1..number).select { |i| number % i == 0 && (i <= 1 || (2..Math.sqrt(i)).any? { |d| i % d == 0 }) }.sum
  puts "Сумма непростых делителей числа #{number} равна #{sum}"
end
sum_of_non_prime_divisors
# МЕТОД 2
def count_digits_less_than_3(number)
  # Преобразуем число в строку, а затем в массив цифр
  digits = number.to_s.chars
  # Подсчитываем цифры, которые меньше 3
  digits.count { |digit| digit.to_i < 3 }
end
print "Введите число: "
number = gets.chomp.to_i
puts "Количество цифр меньше 3: #{count_digits_less_than_3(number)}"
