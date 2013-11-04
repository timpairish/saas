#Define a method sum which takes an array of integers as an argument and returns the sum of its elements. For an empty array it should return zero.
def sum(ints)
  ints.inject(0, :+)
end

#Define a method max_2_sum which takes an array of integers as an argument and returns the sum of its two largest elements. For an empty array it should return zero. For an array with just one element, it should return that element.
def max_2_sum(ints)
  return 0 if ints.empty?
  return ints.first if ints.size == 1
  ints.sort.reverse[0,2].inject(0, :+)
end


#Define a method sum_to_n? which takes an array of integers and an additional integer, n, as arguments and returns true if any two elements in the array of integers sum to n. An empty array should sum to zero by definition.
def sum_to_n?(ints, n)
  return n == 0 if ints.size == 0
  (0...ints.size).each_with_index do |i|
    (i+1...ints.size).each do |j|
      return true if (ints[i]+ints[j]==n)
    end
  end
  return false
end

