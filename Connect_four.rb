
class Game_board
    attr_reader :curr_board
    def initialize
        @curr_board=create_board
    end

    def create_board
         board=[[" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                [" "," "," "," "," "," "," "],
                ["0","1","2","3","4","5","6"]]
                
         return board
    end

    def add_disk(column,color)
        col_arr=[]
        valid_move=false
        
        row=7
        while row>0 && !valid_move
            cell=@curr_board[row][column]
            if cell == " "
                @curr_board[row][column]=color
                valid_move=true
            end
            
            row-=1
        end

        if !valid_move
            puts "Not a valid move"
        end

        # print @curr_board
        
        
    end
end

# my_board=Game_board.new
# my_board.add_disk(1,'R')