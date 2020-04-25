require_relative '../Connect_four'

describe "#create_board" do
    before(:each) do
        @test_game=Game_board.new
    end

    it "Creates an empty 6x7 game board that is numbered on the bottomn" do
         board=[[" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                ["0","1","2","3","4","5","6"]]
        expect(@test_game.create_board).to eql(board)
    end
end
