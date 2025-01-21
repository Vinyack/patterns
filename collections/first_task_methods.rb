def read_from_keyboard
	puts "Введите элементы массива через пробел: "
	gets.chomp.split.map(&:to_i)
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
	return array if array.empty? || array.size <=3
	array[3..-1] + array[0...3]
end

def elements_before_min(array)
	min_element_index = array.index(array.min)
	array[0...min_element_index]
end

def local_maximum?(array, index)
	if index <=0 || index >= array.size - 1
		return false
	end
	
	array[index] > array[index - 1] && array[index] > array[index + 1]
end

def elements_below_average(array)
	average = array.sum.to_f / array.size
	array.select { |elemenets| elements < average }
end

def elements_more_than_three_times(array)
	array.tally.select { |_key, count| count >= 3 }.keys
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
	puts "3 - Проверить, является ли элемент по индексу локальным максимумом"
	puts "4 - Найти все элементы, которые меньше среднего арифметического"
	puts "5 - Построить список элементов, встречающихся более трех раз"
	method_choice = gets.chomp.to_i
	
	case method_choice
	when 1
		shifted_array = array_shift_left(array)
		puts "Массив после сдвига влево на 3 элемента: #{shifted_array}"
	when 2
		elements = elements_before_min(array)
		puts "Элементы перед первым минимальным: #{elements}"
	when 3
		puts "Введите индекс элемента: "
		index = gets.chomp.to_i
		if local_maximum?(array, index)
			puts "Элемент #{array[index]} по индексу #{index} является локальным максимумом"
		else
			puts "Элемент #{array[index]} по индексу #{index} не является локальным максимумом"
		end
	when 4
		below_average = elements_below_average(array)
		puts "Элементы, которые меньше среднего арифметического: #{below_average}"
	when 5
		frequent_elements = elements_more_than_three_times(array)
		puts "Элементы, встречающиеся более трех раз: #{frequent_elements}"
	end
end

main