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

def elements_before_min(array)
	min_element_index = array.index(array.min)
	array[0...min_element_index]
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
	
	puts "Исходный массив: #{array}"
	
	puts "Выберите метод обработки массива: "
	puts "1 - Сдвиг массива влево на 3 элемента"
	puts "2 - Найти элементы перед первым минимальным"
	puts "3 - "
	puts "4 - "
	puts "5 - "
	method_choice = gets.chomp.to_i
	
	case method_choice
	when 1
		shifted_array = array_shift_left(array)
		puts "Массив после сдвига влево на 3 элемента: #{shifted_array}"
	when 2
		elements = elements_before_min(array)
		puts "Элементы перед первым минимальным: #{elements}"
	when 3
	when 4
	when 5
end