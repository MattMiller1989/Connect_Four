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
            it "Stacks even more red disks on top of the previous" do
                board=[[" "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," ","B"," "," "," "],
                        ["0","1","2","3","4","5","6"]]
            
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(3,'B')
                @test_game.add_disk(1,'R')
                expect(@test_game.curr_board).to eql board 
                end
            it "Stacks all the way to the top of a column" do
                board=[[" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," ","B"," "," "," "],
                    ["0","1","2","3","4","5","6"]]
        
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(3,'B')
                @test_game.add_disk(1,'R')
                expect(@test_game.curr_board).to eql board 
                end
            it "Does not allow overstacking" do
                board=[[" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," ","B"," "," "," "],
                        ["0","1","2","3","4","5","6"]]

                    @test_game.add_disk(1,'R')
                    @test_game.add_disk(1,'R')
                    @test_game.add_disk(1,'R')
                    @test_game.add_disk(1,'R')
                    @test_game.add_disk(1,'R')
                    @test_game.add_disk(1,'R')
                    @test_game.add_disk(3,'B')
                    @test_game.add_disk(1,'R')
                    expect(@test_game.add_disk(1,'R')).to eql false
                end

            it "Can put blue on top of a red stack" do
                    board=[[" "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "],
                        [" "," "," "," "," "," "," "],
                        [" ","B"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," "," "," "," "," "],
                        [" ","R"," ","B"," "," "," "],
                        ["0","1","2","3","4","5","6"]]
            
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(3,'B')
                @test_game.add_disk(1,'R')
                @test_game.add_disk(1,'B')
                expect(@test_game.curr_board).to eql board 
            end
            it "Can start a new red stack" do
                board=[[" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" ","B"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R","R","B"," "," "," "],
                    ["0","1","2","3","4","5","6"]]
        
            @test_game.add_disk(1,'R')
            @test_game.add_disk(1,'R')
            @test_game.add_disk(3,'B')
            @test_game.add_disk(1,'R')
            @test_game.add_disk(1,'B')
            @test_game.add_disk(2,'R')
            expect(@test_game.curr_board).to eql board 
            
            end

        
    end
    describe '#check_for_winner' do
        it "Returns winner with a value of R if there are 4 reds on top of eachother" do
             board=[[" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    [" ","R"," "," "," "," "," "],
                    ["0","1","2","3","4","5","6"]]

            @test_game.curr_board=board
            expect(@test_game.check_for_winner('R')).to eql true
        end
        it "Returns winner with a value of R if there are 4 reds horizontally" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" ","R","R","R","R"," "," "],
                   ["0","1","2","3","4","5","6"]]

            @test_game.curr_board=board
           expect(@test_game.check_for_winner('R')).to eql true
        end
        it "Returns winner with a value of R if there are 4 reds diagonally" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," ","R"," "," "],
                   [" "," "," ","R"," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   [" ","R"," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
           expect(@test_game.check_for_winner('R')).to eql true
        end
        it "Returns winner with a value of R if there are 4 reds diagonally the opposite way" do
            board=[[" ","R"," "," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   [" "," "," ","R"," "," "," "],
                   [" "," "," "," ","R"," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
           expect(@test_game.check_for_winner('R')).to eql true
        end
        it "Returns winner with a value of R if there are 4 Blues in a row" do
             board=[[" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," "," "," "," "," "," "],
                    [" "," ","B","B","B","B"," "],
                    [" "," "," "," "," "," "," "],
                    ["0","1","2","3","4","5","6"]]

                    @test_game.curr_board=board
           expect(@test_game.check_for_winner('B')).to eql true
        end
        it "Returns winner with a value of R if there are 4 Blues on top of eachother" do
             board=[[" "," "," "," "," "," "," "],
                    [" "," "," "," ","B"," "," "],
                    [" "," "," "," ","B"," "," "],
                    [" "," "," "," ","B"," "," "],
                    [" "," "," "," ","B"," "," "],
                    [" "," "," "," ","B"," "," "],
                    [" "," "," "," "," "," "," "],
                    ["0","1","2","3","4","5","6"]]

                    @test_game.curr_board=board
          expect(@test_game.check_for_winner('B')).to eql true
       end
        it "Makes sure to interupt non-consecutive disks" do
             board=[[" "," "," "," "," "," "," "],
                    [" "," ","R"," "," "," "," "],
                    [" "," ","R"," "," "," "," "],
                    [" "," ","R"," "," "," "," "],
                    [" "," ","R"," "," "," "," "],
                    [" "," ","B"," "," "," "," "],
                    [" "," ","R"," "," "," "," "],
                    ["0","1","2","3","4","5","6"]]

                    @test_game.curr_board=board
        expect(@test_game.check_for_winner('R')).to eql true
        end
        it "Checks for false positives" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   [" "," ","B"," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('R')).to eql false
        end
        it "Checks for false positives" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   [" "," ","B"," "," "," "," "],
                   [" "," ","R"," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql false
        end
        it "Checks for win conditions on the border of the board" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," ","B","B","B","B"],
                   [" "," "," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql true
        end
        it "Checks for win conditions on the border of the board" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," ","B"],
                   [" "," "," "," "," "," ","B"],
                   [" "," "," "," "," "," ","B"],
                   [" "," "," "," "," "," ","B"],
                   [" "," "," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql true
        end
        it "Checks for win conditions on the top border of the board" do
            board=[[" "," "," ","B","B","B","B"],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql true
        end
        it "Checks for win conditions on the bottom border of the board" do
            board=[[" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," "," "," "," "," "," "],
                   [" "," ","B","B","B","B"," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql true
        end
        it "Checks for win conditions on the left border of the board" do
            board=[[" "," "," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["R"," "," "," "," "," "," "],
                   ["R"," "," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql true
        end
        it "Checks false positives with a ton of values" do
            board=[[" "," "," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["R","R"," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["B"," "," "," "," "," "," "],
                   ["R"," "," "," "," "," "," "],
                   ["R"," "," "," "," "," "," "],
                   ["0","1","2","3","4","5","6"]]

                   @test_game.curr_board=board
        expect(@test_game.check_for_winner('B')).to eql false
        end
        


    end
    
end

                

