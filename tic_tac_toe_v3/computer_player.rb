class Computer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        puts "the computer player " + mark.to_s +  " has made its move"
        legal_positions.shuffle.pop
    end
end