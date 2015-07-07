def largest_palindrome_product
  # Your objective is to find the largest palindrome made from the product of two three-digit numbers.
  first = 100 * 100
  last = 999 * 999
  palindromes = (first..last).select { |num| palindrome?(num) }
  palindromes.reverse.find{|palindrome| three_digit_product?(palindrome)}
end

def palindrome?(num)
  num.to_s == num.to_s.reverse
end

def factors_of(num)
  (1..num).select {|n| n if num % n == 0 }
end

def three_digit_product?(num)
  factors = factors_of(num)
  three_digit_factors = three_digit_numbers_of(factors)
  # is there any three digit factor that equals num when multiplied by any other three digit factor?
  three_digit_factors.collect{|factor| three_digit_factors.collect{|f| factor * f}}.flatten.include?(num)
end

def three_digit_numbers_of(numbers)
  numbers.select{|num| num.to_s.length == 3}
end

def three_digits?(num)
  num.to_s.length === 3
end