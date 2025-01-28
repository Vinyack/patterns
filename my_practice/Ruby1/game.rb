# 1 - запросить имя 
# 2 - сгенерить ранд число
# 3 - счёт и проверка, что попыток < 10
# 4 - ввод числа
# 5 - сравение с рандомным, < = low, > = high
# 6 - если совпадает вывести GJ
# 7 - если все попытки потрачены вывести sorry
# 8 - предложить продолжить
puts "Введите имя: "
input = gets
name = input.chomp 
puts "Welcome, #{name}!" #{Внутри может быть всё что угодно, не обязательно переменные}
# . это оператор

puts "I've got a number between 1 and 100"
puts "Can u guess it?"
digit = rand(100)+1
guessed_it = false
num_guesses = 0 # Количество сделанных попыток
#remaining_guesses = 10 - num_guesses # Количество оставшихся попыток
#puts remaining_guesses.to_s + "guesses left." # применили метод to_s, чтобы избежать ошибку. Без него puts считал бы, что мы складываем числа.
until num_guesses == 10 || guessed_it
puts "You've got #{10 - num_guesses} guesses left."

print "Make a guess: "
guess = gets.to_i # Без метода to_i код не будет работать, так как gets Записывает строку, а для сравнения необходимо число.

num_guesses+=1

if guess < digit
    puts "Low"
elsif guess > digit
    puts "High"
elsif guess == digit
    puts "Yes, u got it, gj #{name}, u guessed my number in #{num_guesses} guesses!"
    guessed_it = true
end
end
# Если попыток не осталось сообщить число
unless guessed_it
    puts "Sorry. U didn't get my number. It was #{digit}"
end







