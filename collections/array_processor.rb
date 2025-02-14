class ArrayProcessor

	def initialize(array)
		@array = array.freeze
	end
	
	def elements
		@array
	end


	# 6
	
	def custom_detect
		return nil unless block_given?
		
		@array.each do |element|
			return element if yield(element)
		end
		nil
	end
	
	# 18
	
	def custom_map
		return [] unless block_given?
		result = []
		@array.each do |element|
		result << yield(element) # передаём текущий элемент блока и сохраняем результат
		end
		result
	end

	# 30

	def custom_select
		return [] unless block_given?
		result = []
		@array.each do |element|
		result << element if yield(element) # добавляем элемент в результат, если блок true
		end
		result
	end

	# 31

	def custom_sort #bubble sort
		return array if array.empty?
		sorted = array.dup
		n = array.length
		
		n.times do |i|
		(n-i-1).times do |j|
		if block_given?
		if yield(sorted[j], sorted[j+1])>0
		sorted[j], sorted[j+1] = sorted[j+1], sorted[j]
		end
		else
		if sorted[j]>sorted[j+1]
		sorted[j], sorted[j+1] = sorted[j+1], sorted[j]
		end
		end
		end
		end
		sorted
		end

	# 19

	def custom_max
		return nil if @array.empty?
		return @array.max unless block_given?
	
		max_element = @array[0]
		@array.each do |element|
		max_element = element if yield(element, max_element) # если блок возвращает true,  значит, что текущий элемент больше текущего максимума
		end
		max_element
	end
	
	# 7
	
	def custom_drop_while
		return @array unless block_given?

		result = []
		dropping = true

		@array.each do |element|
			if dropping && yield(element)
				next
			else
				dropping = false
				result << element
			end
		end
		result
	end
end

# Создаем экземпляр класса с массивом
processor = ArrayProcessor.new([1, 2, 3, 4, 5, 6, 7, 10, 12])

# Вызовы методов
puts "# detect"
puts processor.custom_detect { |el| el > 5 }

puts "# map"
puts processor.custom_map { |el| el * 2 }

puts "# select"
puts processor.custom_select { |el| el.even? }

puts "# sort"
puts processor.custom_sort { |a, b| a > b }

puts "# max"
puts processor.custom_max { |a, b| a <=> b }

puts "# drop_while"
puts processor.custom_drop_while { |el| el < 5 }