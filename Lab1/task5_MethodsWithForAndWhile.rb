# Метод для поиска минимального элемента в массиве
def find_min_element(arr)
  min = arr[0]
  arr.each do |element|
    min = element if element < min
  end
  min
end

# Метод для поиска первого положительного элемента в массиве
def find_first_positive(arr)
  arr.each do |element|
    return element if element > 0
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
