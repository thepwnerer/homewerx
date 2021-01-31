# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise ArgumentError
  else
    raise StandardError 
  end 
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue ArgumentError
    #binding.pry
    p "I love COFFEEEE BUT I NEED FRUIT MFCKKAAA!!!!!!!!! Meow."
    retry
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise ArgumentError.new "Enter at least something, you silly goose!" if self.name.length <= 1
    @yrs_known = yrs_known
    raise ArgumentError.new "You can't be besties if you're under 5 years!!!" if self.yrs_known < 5
    @fav_pastime = fav_pastime
    raise ArgumentError.new "Enter at least something, you silly aarvark!" if self.fav_pastime.length <= 1
  end

  attr_reader :yrs_known, :name, :fav_pastime

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

test = BestFriend.new("DING",6,"self-diddling")

test.talk_about_friendship

test.do_friendstuff

test.give_friendship_bracelet