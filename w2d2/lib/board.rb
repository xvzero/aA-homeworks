class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |pos|
      if pos.between?(0, 5) || pos.between?(7, 12)
        4.times { cups[pos] << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 6) || start_pos.between?(7, 12)
  end

  def make_move(start_pos, current_player_name)
    stones_remaining = cups[start_pos]
    cups[start_pos] = []

    current_pos = start_pos
    until stones_remaining.empty?
      current_pos = (current_pos + 1) % cups.count
      current_pos = 7 if current_pos == 6 && current_player_name == @name2
      current_pos = 0 if current_pos == 13 && current_player_name == @name1
      cups[current_pos] << stones_remaining.pop
    end

    render
    p current_pos, current_player_name
    next_turn(current_pos, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 && current_player_name == @name1 ||
        ending_cup_idx == 13 && current_player_name == @name2
      :prompt
    elsif cups[ending_cup_idx].count == 1
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
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    case cups[6] <=> cups[13]
    when 1
      @name1
    when 0
      :draw
    when -1
      @name2
    end
  end
end
