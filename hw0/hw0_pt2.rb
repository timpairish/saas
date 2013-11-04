#Define a method hello(name) that takes a string representing a name and returns the string "Hello, " concatenated with the name.
def hello(name)
  "Hello, #{name}"
end


#Define a method starts_with_consonant?(s) that takes a string and returns true if it starts with a consonant and false otherwise. (For our purposes, a consonant is any letter other than A, E, I, O, U.) NOTE: be sure it works for both upper and lower case and for nonletters!
def starts_with_consonant?(s)
  return false if s.empty?
  %Q{b c d f g h j k l m q r s t v w x y z}.include? s[0].downcase
end


#Define a method binary_multiple_of_4?(s) that takes a string and returns true if the string represents a binary number that is a multiple of 4. NOTE: be sure it returns false if the string is not a valid binary number!
def binary_multiple_of_4?(s) 
  return false if s.to_i(2) == 0
  (s.to_i(2)) % 4 == 0 
end
