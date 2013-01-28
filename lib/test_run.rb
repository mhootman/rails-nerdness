#encoding: utf-8

"""
Test file for the Saferizer 'sandbox' mode.
Creates objects bob and tom, passes them into
the winner function and calls safe_eval on
a ruby file.  Outputs the result to verify.
"""

require_relative 'saferizer.rb'

bob = {name: 'bob', str: 10, int: 15}
tom = {name: 'tom', str: 10, int: 18}

def winner(bob, tom)
  return Saferizer.safe_eval('ruby_code.rb')
end

puts winner(bob, tom)
