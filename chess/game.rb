require 'colorize'
require_relative "pieces"
require_relative "cursor"
require_relative "board"
require_relative "display"
require "byebug"

class Game
  attr_reader :player1, :player2, :cursor, :board, :display
    def initialize(player1 = 'John', player2 = 'Jane')
      @player1 = player1
      @player2 = player2
      @board = Board.new
      @board.populate
      # debugg
      @display = Display.new(board)
      # @cursor = Cursor.new([0,0], board.grid)
    end
    
    def play
      puts "Please enter first player's name:"
      @player1 = gets.chomp
      puts "Please enter second player's name:"
      @player2 = gets.chomp
      system('clear')
      puts "Welcome to Chess, #{@player1} and #{@player2}!!!"
      # board = Board.new
      # board.populate
      loop do 
        # get new cursor pos 
        system("clear")
        @display.render
        # @display.
      end 
      
      # board.move_piece
    end
end