class Board
  attr_accessor :cups, :player1, :player2

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    non_store_cups = [6, 13]

    cups.each_index do |index|
      unless non_store_cups.include?(index)
        cups[index] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    unless start_pos.between?(1, 6) || start_pos.between?(7, 12)
      raise 'Invalid starting cup'
    end
  end

  def make_move(start_pos, current_player_name)
    available_stones = cups[start_pos]
    cups[start_pos] = []
    until available_stones.empty?
      start_pos += 1
      start_pos += 1 if start_pos == 0 && current_player_name == player2
      start_pos += 1 if start_pos == 13 && current_player_name == player1
      start_pos %= cups.count if start_pos > 13
      cups[start_pos] << available_stones.shift
    end
    render

    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if cups[ending_cup_idx].count == 1
      :switch
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
  end

  def winner
  end
end
