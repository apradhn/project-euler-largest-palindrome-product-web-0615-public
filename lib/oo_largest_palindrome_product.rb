class LargestPalindromeProduct

  def answer
    # Your objective is to find the largest palindrome made from the product of two three-digit numbers.
    num = 999**2
    while num > 0 do 
      if palindrome?(num) && has_three_digit_factors?(num)
        break
      else 
        num -= 1
      end
    end
    num
  end

  def has_three_digit_factors?(num)
    (100..999).any? {|n| num % n == 0 && (num / n) < 1000 }
  end

  def palindrome?(num)
    num.to_s == num.to_s.reverse
  end

end