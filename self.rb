class Dev
  puts self

  def self.say_hi
    puts 'Hi'
  end

  def say(msg)
    puts self
    puts msg
  end

  def scream(msg)
    puts self
    say msg.upcase
  end

  def hi
    self.singleton_class.say_hi
  end
end

dev = Dev.new

devJS = Dev.new

require 'pry'; binding.pry
