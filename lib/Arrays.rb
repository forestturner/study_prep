# Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you
# cannot use additional data structures?
# Hints: #44, # 777, # 7 32


class String
  def check_perm(string2)
    self.spilt().sort() == string2.split().sort()
  end
  def URLify(length)
    result = Array.new(length)
    counter = 0
    self.each do |letter|
      letter == " " ? result[counter] = "%20" : result[counter] = letter
      counter += 1
    end
    result
  end
  def palindrome_perm()
    results = Hash.new(0)
    count = 0
    self.split().each do |letter|
      results[letter] += 1
    end
    self.split().each do |letter|
      (results[letter] % 2 != 0 && count == 0) ? (count += 1) : return false
    end
    true
  end
  # One Away: There are three types of edits that can be performed on strings: insert a character,
  # remove a character, or replace a character. Given two strings, write a function to check if they are
  # one edit (or zero edits) away.
  # EXAMPLE
  # -> true
  # pales. pale -> true
  # pale, pIe pale. bale -> true
  # pale. bake -> false

  def One_away(string1)

  end
  def check_for_insert(string2)
    self.length == (string2.length + 1)
  end
  def check_for_replace(string2)
    counter = 0
    (0...self.length).times do |index|
      if self[index] != string2[index]
        counter += 1
      end
      counter > 1 ?
    end
  end
  def check_for_remove(string2)
    self.length == (string2.length - 1)
  end

  def string_compression()
    compression_hash = Hash.new(0)
    self.each do |letter|
      compression_hash[letter] += 1
    end
    result = ""
    compression_hash.keys.each do |key|
      results += (key.to_s  + compression_hash[key].to_s)
    end
    results.length <= self.length ? self : results
  end
  def rotate_matrix

end






# Check Permutation: Given two strings, write a method to decide if one is a permutation of the
# other.
# Hints: #7, #84, #722, #737

# URLify: Write a method to replace all spaces in a string with '%20: You may assume that the string
# has sufficient space at the end to hold the additional characters, and that you are given the "true"
# length of the string. (Note: If implementing in Java, please use a character array so that you can
# perform this operation in place.)
# EXAMPLE
# Input: "Mr John Smith
# Output: "Mr%20J ohn%20Smith"
# "J
# Hints: #53, #7 78

# Palindrome Permutation: Given a string, write a function to check if it is a permutation of a palin-
# drome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation
# is a rea rrangement of letters. The palindrome does not need to be limited to just dictionary words.
# EXAMPLE
# Input: Tact Coa
# Output: True (permutations: "taco cat". "atco cta". etc.)
# Hints: # 106, #121, #134, #136
