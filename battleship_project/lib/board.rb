class Board
  def initialize(num)
    @grid = Array.new(num) {Array.new(num) { :N }}
    @size = num * num
  end

  def size
    @size
  end

  def [](posarr)
    #[row, column]
    @grid[posarr[0]][posarr[1]]
  end

  def []=(posarr, value)
    @grid[posarr[0]][posarr[1]] = value
  end

  def num_ships
    scount = 0
    @grid.flatten.each { |ele| scount += 1 if ele == :S }
    scount
  end

  def attack(attkposarr)
    if self[attkposarr] == :S
      self[attkposarr] = :H
      puts "you sunk my battleship!"
      true
    else
      self[attkposarr] = :X
      false
    end
  end

  def place_random_ships
    shipstoplace = @size/4

    while shipstoplace > 0
      @grid.each_with_index do |subarr, i|
        subarr.each_with_index do |ele, j|
          if @grid[i][j] == :N && rand(1..4) == 1
            @grid[i][j] = :S
            shipstoplace -= 1
            if shipstoplace == 0
              return @grid
            end
          end
        end
      end
    end
    @grid
  end

  def hidden_ships_grid
    tempgrid = @grid.map(&:clone)

    tempgrid.each_with_index do |subarr, i|
        subarr.each_with_index do |ele, j|
            tempgrid[i][j] = :N if ele == :S
        end
    end
    tempgrid
  end

  def self.print_grid(board)
    board.each do |subarr|
      puts subarr.join(" ")
      end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end




end




                
