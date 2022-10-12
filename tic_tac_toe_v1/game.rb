require_relative "board.rb"
require_relative "human_player.rb"

class Game
    def initialize(mark1, mark2)
        @p1 = HumanPlayer.new(mark1)
        @p2 = HumanPlayer.new(mark2)
        @curp = @p1
        @board = Board.new(3,3)
    end

    def switch_turn
        if @curp == @p1
            @curp = @p2
        else
            @curp = @p1
        end
    end

    def play
        while true
        if @board.emptypositions?
            @board.printboard
            mark = @curp.mark
            begin
                move = @curp.get_position
            rescue
                puts "invalid, try again"
                next
            end
            @board.place_mark(move, mark)
            @board.win?(mark)
            self.switch_turn
        else
            puts "the game is a draw"
            exit
        end
    end
    end
end

g = Game.new("x","m")
g.play