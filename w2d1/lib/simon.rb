class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      system('clear')
      puts "New round, let's go!"
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    current_guess = 0
    while current_guess < sequence_length
      input = require_sequence
      if seq[current_guess] == input
        current_guess += 1
      else
        @game_over = true
      end
    end
    round_success_message
    show_sequence
    @sequence_length += 1
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Please type in the sequence one color at a time:"
    gets.chomp
  end

  def add_random_color
    colors = %w(red blue yellow green)
    @seq += [colors.sample]
  end

  def round_success_message
    puts "You guessed the sequence! Now adding another color."
    puts "Press enter to continue..."
    gets
  end

  def game_over_message
    puts "You messed up the sequence! You lose"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
