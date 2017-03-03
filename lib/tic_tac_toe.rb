class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  @index = input.to_i - 1
end

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == " "
    false
  elsif @board [index] == ""
    false
  elsif @board[index] == nil
    false
  else @board[index] == "X" || "O"
    true
  end
end

def valid_move?(index)
  if index.between?(0, 8) && position_taken?(index) == false
    true
  else
    false
  end
end

def turn_count
  counter = 0
  @board.each do |moves|
    if moves == "X" || moves == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
   turn_count % 2 == 0 ? "X" : "O"
end

def turn
puts "Please enter a number between 1-9:"
input = gets.strip
index = input_to_index(input)
token = current_player
if valid_move?(index) == true
  move(index, token)
  display_board
else
  turn
end
end

def won?
  WIN_COMBINATIONS.find do |combo|
    if position_taken?(combo[0]) &&
       @board[combo[0]] == @board[combo[1]] &&
       @board[combo[0]] == @board[combo[2]]
       return combo
     else
       false
    end
  end
end

def full?
   @board.all? { |space| space == "X" || space == "O"}
end

def draw?
  if full? && !won?
    return true
  else
    return false
  end
end

def over?
  if won? || full? || draw?
     true
  else false
  end
end

def winner
  if !won?
    return nil
  elsif @board[won?[0]] == "X"
    return "X"
  else @board [won?[0]] == "O"
    return "O"
  end
end

def play
  until over? do
    turn
  end
  if won?
    @winner = winner
    puts "Congratulations #{winner}!"
  else draw?
    puts "Cat's Game!"
  end
end

end
