puts "Введите код Ruby, который хотите выполнить"
code = gets.to_s
eval(code)
puts "Введите код ОС, который хотите выполнить"
os = gets.to_s
system(os)
