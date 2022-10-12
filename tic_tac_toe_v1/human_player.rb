class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts @mark.to_s + " it is your turn"
        puts "choose your spot in the grid like this -> 1 3"
        ans = gets.chomp
        raise "invalid input" unless ans.length == 3 && ans[1] == " "
        [ans[0].to_i,ans[2].to_i]
    end

end