require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game

    attr_reader :playersarr

    def initialize(size, playerhash)
        @playersarr = []
        playerhash.each do |markk, aiv|
            if aiv
                @playersarr << Computer.new(markk)
            else
                @playersarr << HumanPlayer.new(markk)
            end
        end
        
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
                move = @curp.get_position(@board.legal_positions)
                @board.place_mark(move, mark)
            rescue
                puts "invalid, try again"
                next
            end

            @board.win?(mark)
            self.switch_turn
        else
            puts "the game is a draw"
            @board.printboard
            exit
        end
    end
    end
end

g = Game.new(3, h: true, u: true, e: true)
# g.play
# # p g.playersarr