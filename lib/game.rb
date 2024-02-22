require './spec/spec_helper'
class Game

    def initialize
        @player_cruiser = Ship.new("Cruiser", 3)
        @player_submarine = Ship.new("Submarine", 2)
        @player_board = Board.new
        @computer_cruiser = Ship.new("Cruiser", 3)
        @comptuer_submarine = Ship.new("Submarine", 2)
        @computer_board = Board.new
    end

    def start
        p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        p "Welcome to BATTLESHIP"
        p "Enter p to play. Enter q to quit."
        p "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        input = gets.chomp.downcase
        if input == "p"
            setup
        elsif input == "q"
            exit
        else
            "Incorrect input"
        end
    end

    def setup
        cruiser_input = []
        submarine_input = []
        @computer_board.place(@computer_cruiser, ["C1", "C2", "C3"])
        @computer_board.place(@comptuer_submarine, ["D3", "D4"])
        puts   "I have laid out my ships on the grid." + "\n" +
            "You now need to lay out your two ships." + "\n"+
            "The Cruiser is three units long and the Submarine is two units long." + "\n"
        puts @player_board.render
        puts "Enter the squares for the Cruiser (3 spaces):"
        loop do cruiser_input
            cruiser_input << gets.chomp.to_s.upcase
        
            if @player_board.valid_placement?(@player_cruiser, cruiser_input) == true
                @player_board_set = @player_board.place(@player_cruiser, cruiser_input)
                break
            else
                "Incorrect input try again!"
            end
        end
        puts @player_board.render(true)
        puts "Enter the squares for the Submarine (2 spaces):"
        loop do
            submarine_input << gets.chomp.to_s.upcase
            if @player_board.valid_placement?(@player_submarine, submarine_input) == true
                @player_board_set = @player_board.place(@player_submarine, submarine_input)
                break
            else
                "Incorrect input try again!"
            end
        end
        puts @player_board.render(true)
        puts "Prepare for battle!!!"
        turn
    end

    def turn
        loop do shot != q || 
            (@player_cruiser.sunk? && @player_submarine.sunk?) || 
            (@computer_cruiser.sunk? && @comptuer_submarine.sunk?)
        puts "=============COMPUTER BOARD============="+ "\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A1")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A2")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A3")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A4")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B1")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B2")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B3")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B4")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C1")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C2")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C3")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C4")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D1")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D2")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D3")
        puts "=============COMPUTER BOARD============="+"\n"
        puts @computer_board.render
        puts "\n"
        puts "==============PLAYER BOARD=============="+ "\n"
        puts @player_board.render(true)
        puts "\n"
        puts "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D4")
        end
    end
end