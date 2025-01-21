class ArrayProcessing

	def initialize(array)
		@array = array.freeze
	end
	
	def elements
		@array
	end
	
	def custom_detect
		return nil unless block_given?
		
		@array.each do |element|
			return element if yield(element)
		end
		nil
	end
	
	def custom_map
		return [] unless block_given?
		result = []
		@array.each do |element|
		result << yield(element) # передаём текущий элемент блока и сохраняем результат
		end
		result
	end
	
	def custom_select
		return [] unless block_given?
		result = []
		@array.each do |element|
		result << element if yield(element) # добавляем элемент в результат, если блок true
		end
		result
	end
	
	def custom_sort
		return @array unless block_given?

		sorted = @array.dup # создание копии массива 

		loop do
			swapped = false # флаг, который указывает, были ли перестановки
			(0...sorted.size - 1).each do |i|
			if yield(sorted[i], sorted[i + 1]) # вызываем блок для сравнения пары
				sorted[i], sorted[i + 1] = sorted[i + 1], sorted[i]
				swapped = true # устанавливаем флаг, если была перестановка
			end
			end
			break unless swapped # если не было перестановок, сортировка завершена
		end

		sorted # возвращаем отсортированный массив
	end
