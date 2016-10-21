require_relative '00_tree_node'

class KnightPathFinder
  # CHESS_GRID = Array.new(8, " "){Array.new(8, " ")}

  attr_accessor :pos
  attr_reader :visited_positions

  def self.valid_moves(pos)
    valids = []

    2.times do |i|
      if  i == 0
        x = 1
        y = 2
      else
        x = 2
        y = 1
      end
      4.times do |j|
        case j
        when 0
          valid_move = [pos[0] + x, pos[1] + y]
        when 1
          valid_move = [pos[0] - x, pos[1] - y]
        when 2
          valid_move = [pos[0] + x, pos[1] - y]
        when 3
          valid_move = [pos[0] - x, pos[1] + y]
        end
        valids << valid_move if valid_move.all? { |el| (0...8).include?(el) }

      end
    end

    valids
  end

  def initialize(pos)
    @pos = pos
    @visited_positions = [pos]
  end

  def new_move_positions(pos)
    new_visits = KnightPathFinder.valid_moves(pos)

    new_visits.select do |visit|
      unless visited_positions.include?(visit)
        self.visited_positions << visit
        true
      end
    end


  end

  def build_move_tree
  end


end
