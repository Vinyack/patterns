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
	
	def custom_select(array)
		return [] unless block_given?
		result = []
		array.each do |element|
		result << element if yield(element) # добавляем элемент в результат, если блок true
		end
		result
	end