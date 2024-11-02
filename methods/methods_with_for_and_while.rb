# Метод для поиска минимального элемента в массиве с использованием цикла for
def find_min_element(arr)
  min = arr[0]
  for i in 1...arr.length
    min = arr[i] if arr[i] < min
  end
  min
end

# Метод для поиска первого положительного элемента в массиве с использованием цикла while
def find_first_positive(arr)
  i = 0
  while i < arr.length
    return arr[i] if arr[i] > 0
    i += 1
  end
  nil  # Возвращаем nil, если положительных элементов не найдено
end

# Ввод массива с клавиатуры
def input_array
  print "Введите элементы массива через пробел: "
  gets.chomp.split.map(&:to_i)  # Разбиваем строку на числа
end

# Основная программа
numbers = input_array

# Находим минимальный элемент
min_element = find_min_element(numbers)
puts "Минимальный элемент: #{min_element}"

# Находим первый положительный элемент
first_positive = find_first_positive(numbers)
puts "Первый положительный элемент: #{first_positive.nil? ? 'Не найден' : first_positive}"
