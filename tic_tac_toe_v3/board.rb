class Board
    def initialize(col, row)
        @grid = Array.new(row) {Array.new(col) {"_"}}
        @col = col
        @row = row
    end

    def valid?(position)
        return false if (position[0] >= @row || position[0] < 0) || (position[1] >= @col || position[1] < 0 )
        true
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def legal_positions
        legalposarr = []
        (@col).times do |i|
            (@row).times do |j|
                legalposarr << [i,j] if @grid[i][j] == "_"
            end
        end
        legalposarr
    end

    def place_mark(position, mark)
        raise "invalid position" unless valid?(position)
        raise "spot already taken" unless empty?(position)
        @grid[position[0]][position[1]] = mark
    end

    def printboard
        @grid.each do |subarr|
            print subarr.join(" ")
            puts ""
        end
    end

    def win_row?(mark)
        @grid.each do |subarr|
            return true if subarr.all? {|ele| ele == mark}
        end
        false
    end

    def win_col?(mark)
        sidegrid = @grid.transpose
        sidegrid.each do |subarr|
            return true if subarr.all? {|ele| ele == mark}
        end
        false
    end

    def win_diagonal?(mark)
        leftdownarr = []
        i = 0
        while i < @grid.length
            row = @grid[i]
            j = 0
            while j < row.length
                leftdownarr << @grid[i][j]
                i += 1
                j += 1   
            end
        end
    
        return true if leftdownarr.all? {|ele| ele == mark}
    
        leftuparr = []
        i = @grid.length - 1
        while i >= 0
            row = @grid[i]
            j = 0
            while j < row.length
                leftuparr << @grid[i][j]
                i -= 1
                j += 1   
            end
        end
    
        return true if leftuparr.all? {|ele| ele == mark}
        false
    end

    def win?(mark)
    
        if win_col?(mark) || win_diagonal?(mark) || win_row?(mark)
            puts mark.to_s + " you win!"
            @board.printboard
            exit 
        else
            false
        end
    end

    def emptypositions?
        @grid.flatten.any? {|ele| ele == "_"}
    end
end

# b = Board.new(4,4)
# p b.legal_positions




