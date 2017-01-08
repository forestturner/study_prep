# Number Swapper: Write a function to swap a number in place (that is, without
# temporary vari-ables).
# Hints: #492, #716, #737

class Array
  def swapper(location_a,location_b)
    self[location_a] =  self[location_a] ^ self[location_b]
    self[location_b] =  self[location_a] ^ self[location_b]
    self[location_a] =  self[location_a] ^ self[location_b]
  end
end

def test_swapper(array)
  array.swapper(array.first, array.last)
  p array
end

test_swapper([0,1,2,3,4,5,6,7,8,9])


#
# Smallest Difference: Given two arrays of integers, compute the pair of values (one value in each
# array) with the smallest (non-negative) difference. Return the difference.
# EXAMPLE
# Input{1,3,15,11,2h{2~12~235,1~8}
# Output 3. That is, the pair (11, 8).


def smallest_difference(array1,array2)
  array1 = array1.sort()
  array2 = array2.sort()
  a = 0
  b = 0
  difference = 99999999999
  while(a < array1.length && b < array2.length)
    if((array1[a] - array2[b]).abs() < difference)
      difference = (array1[a] - array2[b]).abs()
    end
    if(array1[a] < array2[b])
      a+=1
    else
      b+=1
    end
  end
  difference
end

p smallest_difference([1,3,15,11,2],[23,127,235,19,8])


#
#
# Number Max: Write a method that finds the maximum of two numbers. You should not use if-else
# or any other comparison operator.
# 
#
#
# def number_max(number1, number2)
# end
#
# p
#
#
# string1 = "{[()][]()}"
# string2 = "{[(}])"
#
# check_bracket
