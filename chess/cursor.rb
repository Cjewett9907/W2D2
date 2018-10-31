require "io/console"
require 'byebug'
KEYMAP = {
  " " => :space,
  "h" => :left,
  "j" => :down,
  "k" => :up,
  "l" => :right,
  "w" => :up,
  "a" => :left,
  "s" => :down,
  "d" => :right,
  "\t" => :tab,
  "\r" => :return,
  "\n" => :newline,
  "\e" => :escape,
  "\e[A" => :up,
  "\e[B" => :down,
  "\e[C" => :right,
  "\e[D" => :left,
  "\177" => :backspace,
  "\004" => :delete,
  "\u0003" => :ctrl_c,
}
#real version
# MOVES = {
#   left: [0, -1],
#   right: [0, 1],
#   up: [-1, 0],
#   down: [1, 0]
# }
MOVES = {
  left: [-1, 0],
  right: [1, 0],
  up: [0, -1],
  down: [0, 1]
}
require_relative "display"
class Cursor

  attr_reader :cursor_pos, :board, :diff

  def initialize(cursor_pos, board)
    @cursor_pos = cursor_pos
    @board = board
    @diff = [0,0]
    # @display = Display.new(board)
  end

  def get_input
    begin

    key = KEYMAP[read_char]
    # 
    # @display.render
    handle_key(key)
    rescue StandardError => e
    
      # pos = [cursor_pos[0] - @diff[0], cursor_pos[1] - @diff[1]]
      retry
    end
    
    
  end

  private

  def read_char
    STDIN.echo = false # stops the console from printing return values

    STDIN.raw! # in raw mode data is given as is to the program--the system
                 # doesn't preprocess special characters such as control-c

    input = STDIN.getc.chr # STDIN.getc reads a one-character string as a
                             # numeric keycode. chr returns a string of the
                             # character represented by the keycode.
                             # (e.g. 65.chr => "A")

    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil # read_nonblock(maxlen) reads
                                                   # at most maxlen bytes from a
                                                   # data stream; it's nonblocking,
                                                   # meaning the method executes
                                                   # asynchronously; it raises an
                                                   # error if no data is available,
                                                   # hence the need for rescue

      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true # the console prints return values again
    STDIN.cooked! # the opposite of raw mode :)

    return input
  end

  def handle_key(key) #add invalid method later
    
    @diff = MOVES[key]
    case key
    when :up
      if @cursor_pos[1] == 0
        raise StandardError.new "Out of boarder"
      end
      
      # board.valid_pos?(pos)
      
      # real_diff = MOVES[key]
      update_pos(diff)
    when :down
      if @cursor_pos[1] == 7
        raise StandardError.new "Out of boarder"
      end
      update_pos(diff) 
    when :left
      if @cursor_pos[0] == 0
        raise StandardError.new "Out of boarder"
      end
      update_pos(diff)
    when :right
      if @cursor_pos[0] == 7
        raise StandardError.new "Out of boarder"
      end
      update_pos(diff)
    when :ctrl_c
      exit 0
    end
    # diff = [cursor_pos[0] + key[0], cursor_pos[1] + key[1]] 
    # update_pos(diff)
    return key
  end

  def update_pos(diff)
    @cursor_pos = [cursor_pos[0] + diff[0], cursor_pos[1] + diff[1]] 
  end
end