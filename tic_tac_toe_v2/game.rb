require_relative "board.rb"
require_relative "human_player.rb"

class Game

    attr_reader :playersarr

    def initialize(size, *marks)
        @playersarr = []
        marks.each { |pmark| @playersarr << HumanPlayer.new(pmark)}
        @curp = @playersarr[0]
        @board = Board.new(size,size)
    end

    def switch_turn
        curpindex = @playersarr.index(@curp)
        @curp = @playersarr[(curpindex + 1) % @playersarr.length]
    end

    def play
        while true
        if @board.emptypositions?
            @board.printboard
            mark = @curp.mark
            begin
                move = @curp.get_position
                @board.place_mark(move, mark)
            rescue
                puts "invalid, try again"
                next
            end

            @board.win?(mark)
            self.switch_turn
        else
            puts "the game is a draw"
            exit
        end
    end
    end
end

g = Game.new(5,"x","m","o")
g.play
# p g.playersarr