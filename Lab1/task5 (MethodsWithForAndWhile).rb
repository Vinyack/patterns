# ЗАДАНИЕ 5
# Метод для поиска минимального элемента в массиве
def find_min_element(arr)
	min = arr[0]
	for i in 1...arr.length
		if arr[i] < min
			min = arr[i]
		end
	end
	return min
end
# Метод для поиска первого положительного элемента в массиве
def find_first_positive(arr)
  i = 0
  while i < arr.length
    if arr[i] > 0
      return arr[i]  # Возвращаем первый положительный элемент
    end
    i += 1
  end
  nil  # Возвращаем 0, если положительных элементов не найдено
end
# Создаем массив чисел
numbers = [-5, -10, 0, 3, -1, 7, -3]

# Находим минимальный элемент
min_element = find_min_element(numbers)
puts "Минимальный элемент: #{min_element}"

# Находим первый положительный элемент
first_positive = find_first_positive(numbers)
puts "Первый положительный элемент: #{first_positive.nil? ? 'Не найден' : first_positive}"