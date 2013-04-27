class GuessTheNumber

  def initialize
    @score = 0
  end

  def play!
    puts "Guess the nubmer between 1 and 100"
    puts "Ready to play!"
    pick_random_number
    game_loop
  end

  def pick_random_number
    @computer_number = Random.rand(100)
  end

  def game_loop
    keep_playing = true
    while(keep_playing)
      puts "What is your guess?\n"
      number = gets.chop!.to_i
      @score += 1
      if number < @computer_number
        puts "Your number is too low.\n"
      elsif number > @computer_number
        puts "Your number is too high.\n"
      else
        keep_playing = false
        puts "You win. it only took you #{@score} tries!"
      end
    end
  end
  
end

game = GuessTheNumber.new
game.play!
