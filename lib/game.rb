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
            @setup
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
        p   "I have laid out my ships on the grid." + "\n" +
            "You now need to lay out your two ships." + "\n"+
            "The Cruiser is three units long and the Submarine is two units long." + "\n"
        p @player_board.render
        p "Enter the squares for the Cruiser (3 spaces):"
        loop do
            cruiser_input << gets.chomp.to_s.upcase
        
            if @player_board.valid_placement?(@player_cruiser, cruiser_input) == true
                @player_board_set = @player_board.place(@player_cruiser, cruiser_input)
                break
            else
                "Incorrect input try again!"
            end
        end
        p @player_board.render(true)
        p "Enter the squares for the Submarine (2 spaces):"
        loop do
            submarine_input << gets.chomp.to_s.upcase
            if @player_board.valid_placement?(@player_submarine, submarine_input) == true
                @player_board_set = @player_board.place(@player_submarine, submarine_input)
                break
            else
                "Incorrect input try again!"
            end
        end
    end

    def turn
        loop do while shot != q || 
            (@player_cruiser.sunk? && @player_submarine.sunk?) || 
            (@computer_cruiser.sunk? && @comptuer_submarine.sunk?)
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A1")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A2")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A3")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("A4")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B1")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B2")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B3")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("B4")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C1")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C2")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C3")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("C4")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D1")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D2")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D3")
        p "=============COMPUTER BOARD============="+"\n"
        @computer_board.render
        p "\n"
        p "==============PLAYER BOARD=============="+ "\n"
        @player_board.render(true)
        p "\n"
        p "Enter the coordinate for your shot:"
        shot = gets.chomp.to_s.upcase
        @computer_board.fire_at(shot)
        @player_board.fire_at("D4")
    end
end