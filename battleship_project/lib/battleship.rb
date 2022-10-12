require_relative "board"
require_relative "player"

class Battleship

    def initialize(length)
        @player = Player.new
        @board = Board.new(length)
        @remaining_misses = @board.size/2
    end

    def board
        @board
    end

    def player
        @player
    end

    def start_game 
        @board.place_random_ships
        puts @board.size/4
        @board.print
    end

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        end
        false
    end

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        end
        false
    end

    def game_over?
        return true if win? || lose
        false
    end

    def turn
        puts "Your move please"
        ans = gets.chomp
        attk = [ans[0].to_i,ans[1].to_i]
        @board.attack[ans]
        @board.print
        puts @remaining_misses
    end

    

end
