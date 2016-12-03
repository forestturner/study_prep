
def create_array_of_bottles
  array_of_bottles = []
  bottle_with_p = rand(1000)
  1000.times do |i|
    temp_bottle = Bottle.new
    if i == bottle_with_p
      temp_bottle.is_poison = true;
    end
    array_of_bottles << temp_bottle
  end
  array_of_bottles
end


def find_poison(array_of_bottles)
  array_of_bottles.each_with_index do |b,i|
    if b.is_poison
      p i
    end
  end
  return -1
end

def find_poison_using_b_search(array_of_bottles)
  mid = find_length_in_log_n(array_of_bottles,1) / 2
end

def find_length_in_log_n(array_of_bottles, test_number)
  if array_of_bottles[test_number] != nil
    find_length_in_log_n(array_of_bottles, test_number * 2)
  else
    p "length_in_log_n : #{test_number}"
    return test_number
  end
  return test_number
end

class Bottle
  attr_accessor :is_poison
  def initialize
    @is_poison = false;
  end
end


find_poison(create_array_of_bottles())
