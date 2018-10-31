require 'colorize'
require_relative "pieces"
# require_relative "cursor"
require_relative "game"

class Board
  Q = '♕'
  K = '♔'
  R = '♖'
  B = '♗'
  N = '♘'
  P = '♙'
  SQUARE = ' '

  attr_accessor :grid, :piece, :blank_bob

  def initialize(piece = nil)
    @grid = [%w(R N B Q K B N R),
    %w(P P P P P P P P),
    [nil,nil,nil,nil,nil,nil,nil,nil],
    [nil,nil,nil,nil,nil,nil,nil,nil],
    [nil,nil,nil,nil,nil,nil,nil,nil],
    [nil,nil,nil,nil,nil,nil,nil,nil],
    %w(P P P P P P P P),
    %w(R N B Q K B N R)]
    @blank_bob = NilPiece.new(:green, SQUARE)
    # @cursor = Cursor.new([0,0], self)
    # @cursor_pos = 
  end
  
  def populate
    @grid.each_with_index do |row, i|
      row.each_with_index do |piece, j|
        case piece
        when 'R'
          @grid[i][j] = Rook.new(:black, R) if i == 0 
          @grid[i][j] = Rook.new(:white, R) if i == 7
        when 'N'
          @grid[i][j] = Knight.new(:black, N) if i == 0 
          @grid[i][j] = Knight.new(:white, N) if i == 7
        when 'Q'
          @grid[i][j] = Queen.new(:black, Q) if i == 0 
          @grid[i][j] = Queen.new(:white, Q) if i == 7
        when 'K'
          @grid[i][j] = King.new(:black, K) if i == 0 
          @grid[i][j] = King.new(:white, K) if i == 7
        when 'B'
          @grid[i][j] = Bishop.new(:black, B) if i == 0 
          @grid[i][j] = Bishop.new(:white, B) if i == 7
        when 'P'
          @grid[i][j] = Pawn.new(:black, P) if i == 1
          @grid[i][j] = Pawn.new(:white, P) if i == 6 
        when nil
          @grid[i][j] = blank_bob
        end
      end
    end
  end

  def change_icon
    @grid.each do |subarr|
      subarr.map! do |spot|
        if spot == 'K'
            spot = K.colorize(:green)
        elsif spot == 'Q'
          spot = Q
        elsif spot == 'R'
          spot = R
        elsif spot == 'B'
          spot = B
        elsif spot == 'N'
          spot = N
        elsif spot == 'P'
          spot = P
        else
          spot = SQUARE
        end
      end
    end
    @grid
  end
  
  # def display
  #   # @cursor = Cursor.new([0,0], board.grid)
  #   checkerizer = [:light_black, :gray]
  #   check_var = 0 
  # 
  #   puts "--------------------------"
  #   @grid.each_with_index do |row, i|
  #     check_var += 1
  #     row.each_with_index do |piece, j|
  #       check = check_var % 2
  #       if j == 0
  #         print "|" + " #{piece.emo} ".colorize(piece.color).colorize( :background => checkerizer[check] )
  #         check_var += 1
  #       else
  #         print " #{piece.emo} ".colorize(piece.color).colorize( :background => checkerizer[check] )
  #         check_var += 1
  #       end
  #       puts "| #{i}"  if j + 1 == row.length
  # 
  #     end
  #   end
  #   puts "--------------------------"
  #   puts "  0  1  2  3  4  5  6  7"
  #   @cursor.get_input
  # 
  #   return ''
  # end
  

  def move_piece(color, start_pos, end_pos) #still need to add color as arg and valid_pos? method
    begin
      puts "Please enter your starting position, e.g. '0,1':"
      start_pos = get_input #[1,2]
      valid_pos?(start_pos)
    rescue StandardError => e
      puts "Bad move!"
      retry
    end
      
    begin
      puts "Please enter your ending position, e.g. '0,1':"
      end_pos = get_input
      valid_pos?(end_pos)
    rescue StandardError => e
      puts "Bad move!"
      retry
    end

    i, j = start_pos[0], start_pos[1]
    k, l = end_pos[0], end_pos[1]
    @grid[j][i],@grid[l][k] = @grid[l][k],@grid[j][i]
    display
    
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row,col = pos
    @grid[row][col] = value
  end
  
  
  def valid_pos?(pos)
    valid_range  = (0..7).to_a
    if pos.all? {|int| valid_range.include?(int)}
      true
    else
      raise StandardError.new "Invalid input! Please re-enter a position:"
    end
  end

  def add_piece(piece, pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)


  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row,col = pos
    @grid[row][col] = value
  end

  def get_input
    arr = []
    input = gets.chomp
    input.split(',').each do |int|
      arr << int.to_i
    end
    arr
  end
end


if $PROGRAM_NAME == __FILE__
  board = Board.new
  board.display
  board.move_piece
end

