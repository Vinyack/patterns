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
			