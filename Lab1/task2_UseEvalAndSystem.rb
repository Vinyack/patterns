puts "Введите код Ruby, который хотите выполнить"
code = gets
eval(code)
puts "Введите код ОС, который хотите выполнить"
os = gets
system(os)
