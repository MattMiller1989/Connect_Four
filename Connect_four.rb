
class Game_board
    attr_accessor :curr_board
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
        while row>=0 && !valid_move
            cell=@curr_board[row][column]
            if cell == " "
                @curr_board[row][column]=color
                valid_move=true
            end
            
            row-=1
        end

        if !valid_move
            # return "Not a valid move"
            return false
        else
            return true
        end

        # print @curr_board
        
        
    end
    def check_for_winner(color)
        found =false

        for r in 0..6

            for c in 0..6
                #puts "r:#{r} c:#{c}"
                if @curr_board[r][c]==color
                    dir=find_direction(r,c,color)
                    #puts "r:#{r} c:#{c} dir:#{dir}"
                    if dir
                         return true
                    end
                end
            end
        end

        return found


    end
    def find_direction(r,c,color)
        found = false
        
         win_arr=[]
        
        
        if r<=2
            s_arr=[@curr_board[r+1][c],@curr_board[r+2][c],@curr_board[r+3][c]]
            win_arr.push(s_arr)
            
            if c<=3
                se_arr=[@curr_board[r+1][c+1],@curr_board[r+2][c+2],@curr_board[r+3][c+3]] 
                win_arr.push(se_arr)
                
            end
            if c>=3
                sw_arr=[@curr_board[r+1][c-1],@curr_board[r+2][c-2],@curr_board[r+3][c-3]]
                win_arr.push(sw_arr)
                

            end
        end
        
        if r>=3
            n_arr=[@curr_board[r-1][c],@curr_board[r-2][c],@curr_board[r-3][c]]
            
            win_arr.push(n_arr)
            
            if c<=3
                ne_arr=[@curr_board[r-1][c+1],@curr_board[r-2][c+2],@curr_board[r-3][c+3]]
                win_arr.push(ne_arr)
                
                
            end
            if c>=3
                nw_arr=[@curr_board[r-1][c-1],@curr_board[r-2][c-2],@curr_board[r-3][c-3]]
                win_arr.push(nw_arr)
                
            end

        end
        
        if c<=3
            e_arr=[@curr_board[r][c+1],@curr_board[r][c+2],@curr_board[r][c+3]]
            win_arr.push(e_arr)
            
        end
        if c>=3
            w_arr=[@curr_board[r][c-1],@curr_board[r][c-2],@curr_board[r][c-3]]
            win_arr.push(w_arr)
            
        end

        
            
        win_arr.each do |e|
            
            if e.all? {|a| a==color}
                found =true
                
            end
        end

        return found

    end
    def get_player_choice(is_red)
        good_choice=false
        if is_red
            color='R'
        else
            color='B'
        end
        while !good_choice

            puts "Pick your move [0-6] to place a #{color} disk"
            move=gets.chomp
            good_choice=move.match(/^[0-6]$/)
        end
        return move.to_i
    end
    def run_game
        game_over=false
        is_red=true
        while !game_over
            valid_red_move=false
            while ! valid_red_move
                choice=get_player_choice(is_red)
                valid_red_move=add_disk(choice,'R')
            end
            if check_for_winner('R')
                game_over=true
                declare_winner('R')
                break
            end
            print_board
            is_red=false
            valid_blue_move=false
            while ! valid_blue_move
                choice=get_player_choice(is_red)
                valid_blue_move=add_disk(choice,'B')
            end
            if check_for_winner('B')
                game_over=true
                declare_winner('B')
                break
            end
            print_board
            is_red=true
        end


    end
    def print_board
        @curr_board.each do |n|
            print n
            puts
        end
    end
    def declare_winner(color)
        puts "#{color} HAS WON THE GAME!! DO YOU WANT TO PLAY AGAIN? [y/n]"
        play_again=gets.chomp
        if play_again=='y'
            @curr_board=create_board
            run_game
        end

    end       
       
    
end


# board=[[" "," "," "," "," "," "," "],
#                    [" "," "," "," "," "," "," "],
#                    [" "," "," "," "," "," "," "],
#                    [" "," "," "," "," "," "," "],
#                    [" "," "," "," "," "," "," "],
#                    [" "," "," "," "," "," "," "],
#                    [" "," ","R","R","R"," "," "],
#                    ["0","1","2","3","4","5","6"]]


  my_board=Game_board.new
#  my_board.curr_board=board
# my_board.add_disk(1,'R')
# my_board.add_disk(1,'R')
# my_board.add_disk(1,'R')
# my_board.add_disk(1,'R')
# my_board.add_disk(1,'R')
# my_board.add_disk(1,'R')

#  print my_board.curr_board.class
#  my_board.check_for_winner('R')
my_board.run_game