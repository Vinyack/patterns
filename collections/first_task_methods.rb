def read_from_keyboard
	puts "Введите элементы массива через пробел: "
	gets.chomp.split.map(&: to_i)
end

def read_from_file(filename)
	if File.exist?(filename)
		File.read(filename).split.map(&:to_i)
		else
		puts "Файл не найден!"
		exit
	end
end

def array_shift_left(array)
	return aray if array.empty? || array.size <=3
	array[3..-1] + array[0...3]
end

def main
	puts "Выберите способ ввода данных: "
	puts "1 - ввод с клавиатуры"
	puts "2 - ввод из файла"
	choice = gets.chomp.to_i
	
	case choice
	
	when 1
		array = read_from_keyboard
	when 2
		puts "Введите путь к файлу"
		filename = gets.chomp
		array = read_from_file(filename)
	else
		puts "Некорректный выбор!"
		exit
	end