require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(codeinst)
        puts @secret_code.num_exact_matches(codeinst)
        puts @secret_code.num_near_matches(codeinst)
    end

    def ask_user_for_guess
        puts "Enter a code"
        ans = gets.chomp
        codeans = Code.from_string(ans)
        print_matches(codeans)
        @secret_code.pegs == codeans.pegs ? true : false
    end
end
