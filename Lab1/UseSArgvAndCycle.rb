# Принимаем имя пользователя. Если не передан аргумент, запрашиваем имя у пользователя.
if ARGV.empty?
  puts "Как тебя зовут?"
  name = gets.chomp
else
  name = ARGV[0]
end
# Очищаем ARGV, иначе он будет мешать методу gets
ARGV.clear
puts "Какой у тебя любимый язык программирования?"
input = gets.chomp
if input == "Ruby"
	puts "Подлиза, fu-u"
elsif input == "C++"
	puts "Смешно и грустно одновременно, но не расстраивайся, скоро будет руби"
elsif input == "Python"
	puts "ХА-ХА, неважно, скоро будет руби"
elsif input == "Java"
	puts "Ява, джава, жава,иава ,неважно ,скоро будет руби"
else puts "IDK"
end