class Integer

def to_eng
	if self < 0 # No negative numbers.
		return 'Please enter a number that isn\'t negative.' 
	end
	if self == 0 
		return 'zero'
	end
	# No more special cases! No more returns!
	num_string = '' # This is the string we will return.
	ones_place = ['one',       'two',      'three',
	            'four',      'five',     'six',
	            'seven',     'eight',    'nine']
	tens_place = ['ten',       'twenty',   'thirty',
	            'forty',     'fifty',    'sixty',
	            'seventy',   'eighty',   'ninety']
	teenagers  = ['eleven',    'twelve',   'thirteen',
	            'fourteen',  'fifteen',  'sixteen',
				'seventeen', 'eighteen', 'nineteen'] 
	powers_of_ten = {
        (10**63) => "vigintillion",
        (10**60) => "novemdecillion",
        (10**57) => "octodeceillion",
        (10**54) => "septendecillion",
        (10**51) => "sexdecillion",
        (10**48) => "quindecillion",
        (10**45) => "quattuordecillion",
        (10**42) => "tredecillion",
        (10**39) => "duodecillion",
        (10**36) => "undecillion",
        (10**33) => "decillion",
        (10**30) => "nonillion",
        (10**27) => "octillion",
        (10**24) => "septillion",
        (10**21) => "sextillion",
        (10**18) => "quintillion",
        (10**15) => "quadrillion",
        (10**12) => "trillion",
        (10**9) => "billion",
        1000000 => "million",
        1000 => "thousand"
    }
	
	left = self
	powers_of_ten.each do |key, value|
		write = left / key
		left = left - write * key
		num_string += "#{write.to_eng} #{value}" if write > 0
		if write > 0 && left > 0
		  num_string << " "
		end
	end

	write = left/100 # How many hundreds left?
	left = left - write*100 # Subtract off those hundreds.
	if write > 0
	# Now here's the recursion:
		hundreds = write.to_eng
		num_string = num_string + hundreds + ' hundred' 
		if left > 0
	      	#  So we don't write 'two hundredfifty-one'...
	      	num_string = num_string + ' '
		end 
	end

	write = left/10 # How many tens left?
	left = left - write*10 # Subtract off those tens.

	if write > 0
		if ((write == 1) and (left > 0))
	      	#  Since we can't write "tenty-two" instead of
	      	#  "twelve", we have to make a special exception
	      	#  for these.
	      	num_string = num_string + teenagers[left-1]
			# The "-1" is because teenagers[3] is
			# 'fourteen', not 'thirteen'.
			# Since we took care of the digit in the
			# ones place already, we have nothing left to write. 
			left = 0
		else
	     	num_string = num_string + tens_place[write-1]
	      	#  The "-1" is because tens_place[3] is
			# 'forty', not 'thirty'. 
		end
		if left > 0
			# So we don't write 'sixtyfour'... 
			num_string = num_string + '-'
		end 
	end
	write = left # How many ones left to write out? 
	left = 0 # Subtract off those ones.
	
	if write > 0
		num_string = num_string + ones_place[write-1] 
		# The "-1" is because ones_place[3] is
		# 'four', not 'three'.
	end
	  #  Now we just return "num_string"...
	num_string
end
end
puts 0.to_eng
puts 9.to_eng
puts 19.to_eng
puts 10.to_eng
puts 998989.to_eng


class Array
	def kevshuffle
		shuffled_arr = []
 		self.size.times  do
 		index = rand(self.length)
 		shuffled_arr << self[index]
 		self.delete_at(index)
 	end
	return shuffled_arr
end
end
print [1,2,3,4,5,6,7,8,9].kevshuffle


class Integer
	def to_roman
  num = self
  m = num / 1000
  current = num - m*1000
  d = current / 500
  current = current - d*500
  c = current / 100
  current = current - c*100
  l = current / 50
  current = current - l*50
  x = current / 10
  current = current - x*10
  v = current / 5
  current = current - v*5
  i = current
  "M"*m + "D"*d + "C"*c + "L"*l + "X"*x +  "V"*v + "I"*i
end

def factorial
    if self < 0
      return "You can't take the factorial of a negative number!"
    end
    if self <= 1
      1
    else
      self * (self-1).factorial
    end
  end
end




