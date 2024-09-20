# ЗАДАНИЕ 5
# метод для поиска минимального элемента в массиве
def find_min_element(arr)
	min = arr[0]
	for i in 1...arr.length
		if arr[i] < min
			min = arr[i]
		end
	end
	return min
end