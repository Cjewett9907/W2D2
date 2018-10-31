require_relative "cursor"
# require_relative "game"

class Display
  attr_reader :board, :cursor 
  
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end
  
  def render
    # @cursor = Cursor.new([0,0], board.grid)
    checkerizer = [:light_black, :yellow]
    check_var = 0 
    
    puts "--------------------------"
    @board.grid.each_with_index do |row, i|
      check_var += 1
      row.each_with_index do |piece, j|
        check = check_var % 2
        if [i, j] == @cursor.cursor_pos
          print " #{piece.emo} ".colorize(piece.color).colorize( :background => :purple )
        elsif j == 0
          print "|" + " #{piece.emo} ".colorize(piece.color).colorize( :background => checkerizer[check] )
        else
          print " #{piece.emo} ".colorize(piece.color).colorize( :background => checkerizer[check] )
        end
        check_var += 1
        puts "| #{i}"  if j + 1 == row.length 
      end
    end
    puts "--------------------------"
    puts "  0  1  2  3  4  5  6  7"
    
    # key_pressed = "no"
    # until key_pressed == :return
    #   system('clear')
    #   self.render
      @cursor.get_input      
    # end
    
    
    # @cursor.update_pos(diff)
    
    return ''
  end
  
end