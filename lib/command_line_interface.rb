def welcome
  # puts out a welcome message here!
  puts "Welcome Star Wars Fan!"
end

def get_character_from_user
  puts "please enter a character"
  input = gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
  return input
end
