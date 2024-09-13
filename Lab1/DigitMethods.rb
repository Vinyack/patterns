# ВАРИАНТ 6
# МЕТОД 1
def sum_of_non_prime_divisors
  print "Введите число: "
  n = gets.to_i
  # Проверка, является ли число простым
  sum = (1..n).select { |i| n % i == 0 && (i <= 1 || (2..Math.sqrt(i)).any? { |d| i % d == 0 }) }.sum
  puts "Сумма непростых делителей числа #{n} равна #{sum}"
end
sum_of_non_prime_divisors
