class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []

  end

  def play
    while @game_over == false
      take_turn
    end
    game_over_message
    reset_game

  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over == true
      round_success_message
      @sequence_length += 1
    end

  end

  def show_sequence
    add_random_color
    @seq.each do |el|
      system("clear")
      p el
      sleep 0.75
      system("clear")
      sleep 0.10
    end
    system("clear")

  end

  def require_sequence
    i = 0
    puts 'enter sequence, one at a time:'
    #return @game_over = true if guesses.length != @sequence
    while i < @seq.length && @game_over == false
      print '> '
      guess = gets.chomp
      unless guess == @seq[i]
        @game_over = true
      end
      i += 1
    end

  end

  def add_random_color
    @seq << COLORS.shuffle.first.dup

  end

  def round_success_message
    puts "beat round #{@sequence_length}!"
    sleep 0.75

  end

  def game_over_message
    puts "could not beat round #{@sequence_length}!"
    sleep 1
    system("clear")
    puts "game reset!"

  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end

x = Simon.new
x.play
