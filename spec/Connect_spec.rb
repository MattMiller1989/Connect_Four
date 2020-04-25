require_relative '../Connect_four'


describe Game_board do
    orig_board=[[" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                ["0","1","2","3","4","5","6"]]
    before(:each) do
        @test_game=Game_board.new
    end
    
    describe "#create_board" do
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
    describe '#add_disk' do
        it "Puts a red disk onto an empty column" do
             board=[[" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    ["0","1","2","3","4","5","6"]]
            
            # subject { @test_game.add_disk(1,'R')}
             @test_game.add_disk(1,'R')
            expect(@test_game.curr_board).to eql board 
        end
        it "Puts a blue disk into another column" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" ","R"," ","B"," "," "," "],
                   ["0","1","2","3","4","5","6"]]
           
           # subject { @test_game.add_disk(1,'R')}
            @test_game.add_disk(1,'R')
            @test_game.add_disk(3,'B')
           expect(@test_game.curr_board).to eql board 
       end
       it "Puts a Red disk into another column" do
        board=[[" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" ","R","R","B"," "," "," "],
               ["0","1","2","3","4","5","6"]]
       
       # subject { @test_game.add_disk(1,'R')}
        @test_game.add_disk(1,'R')
        @test_game.add_disk(3,'B')
        @test_game.add_disk(2,'R')
       expect(@test_game.curr_board).to eql board 
   end
       it "Stacks an additional red disk on top of another" do
        board=[[" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" "," "," "," "," "," "," "],
               [" ","R"," "," "," "," "," "],
               [" ","R"," ","B"," "," "," "],
               ["0","1","2","3","4","5","6"]]
       
       
        @test_game.add_disk(1,'R')
        @test_game.add_disk(3,'B')
        @test_game.add_disk(1,'R')
       expect(@test_game.curr_board).to eql board 
   end
    end
    
                
end
