require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    (0..5).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    (7..12).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    valid = [0,1,2,3,4,5,7,8,9,10,11,12]
    raise 'Invalid starting cup' unless valid.include?(start_pos)
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones_to_move = @cups[start_pos].dup
    cup_idx = start_pos
    @cups[start_pos] = []
    until stones_to_move.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[6] << stones_to_move.pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[13] << stones_to_move.pop if current_player_name == @name2
      else
        @cups[cup_idx] << stones_to_move.pop
      end
    end
    self.render
    self.next_turn(cup_idx)

  end

  def next_turn(ending_cup_idx)
    #byebug
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    if @cups[13] == @cups[6]
      return :draw
    elsif @cups[13].length > @cups[6].length
      return @name2
    else
      return @name1
    end
  end
end
