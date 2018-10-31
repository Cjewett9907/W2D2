require 'colorize'
require_relative "board"

class Player
  attr_accessor :player_name
  def initialize(player_name = nil)
    @player_name = player_name
    @board = Board.new
  end

  def play
    puts "Please enter a player name:"
    @player_name = gets.chomp
    system('clear')
    puts "        Welcome to Chess, #{@player_name}"
    @board.display
    @board.move_piece
  end
end

if $PROGRAM_NAME == __FILE__
  player = Player.new
  player.play
end
