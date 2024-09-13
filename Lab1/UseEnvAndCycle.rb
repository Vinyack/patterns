username = ENV['user']
puts "Привет, #{username}"
puts "Какой у тебя любимый язык программирования?"
input = gets.chomp
if input == "Ruby"
	puts "Подлиза"
elsif input == "C++"
	puts "Смешно и грустно одновременно, но не расстраивайся, скоро будет руби"
elsif input == "Python"
	puts "ХА-ХА, неважно, скоро будет руби"
elsif input == "Java"
	puts "Ява джава жава иава,неважно, скоро будет руби"
else puts "IDK"
end