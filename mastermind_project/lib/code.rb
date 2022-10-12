class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def initialize(chararr)

    if Code.valid_pegs?(chararr)
      @pegs = chararr.map {|ele| ele.upcase } 
    else
      raise ArgumentError.new "What are those, bargain bin pegs?" 
    end

  end

  def self.valid_pegs?(chararr)
    return true if chararr.map {|ele| ele.upcase } - POSSIBLE_PEGS.keys == []
    false
  end

  def pegs
    @pegs
  end

  def self.random(length)
    randomarr = Array.new(length, 0)
    newarr = randomarr.map {|ele| POSSIBLE_PEGS.keys[rand(0..3)] }
    Code.new(newarr)
  end

  def self.from_string(pegstr)
    Code.new(pegstr.split(""))
  end

  def[](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(codeinstguess)
    count = 0
    codeinstguess.pegs.each_with_index {|ele, i| count += 1 if ele == @pegs[i] }
    count
  end

  def num_near_matches(codeinstguess)
    count = 0
    counthashpegs1 = Hash.new(0)
    counthashguess2 = Hash.new(0)
    
    codeinstguess.pegs.each {|ele| counthashguess2[ele] += 1}
    @pegs.each {|ele| counthashpegs1[ele] += 1}

    counthashpegs1.each do |key,val|
      if counthashguess2[key] <= counthashpegs1[key]
        count += counthashguess2[key]
      elsif counthashguess2[key] > counthashpegs1[key]
        count += val
      end
    end
    count -= num_exact_matches(codeinstguess)
  end

  def ==(codeinst)
    return false if self.pegs.length != codeinst.pegs.length
    self.pegs == codeinst.pegs
  end


end


pm = Code.new(["R","B"])
p pm
p Code.random(6)

