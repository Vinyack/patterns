def array_shift_left(array)
	return aray if array.empty? || array.size <=3
	array[3..-1] + array[0...3]
end
array = [1, 2, 3, 4, 5, 6, 7]
puts array.inspect
new_array = array_shift_left(array)
puts new_array.inspect