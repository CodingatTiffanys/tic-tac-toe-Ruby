# Tic Tac Toe Game application that plays the computer
class TicTacToeGame
  attr_accessor :board

  # initialize the class
  def initialize
    @board = Array.new(9, " ")
  end

  # method defined to display the new board using an array
  def display_board
    puts " #{@board[0]}  | #{@board[1]}  | #{@board[2]} "
    puts '---------------'
    puts " #{@board[3]}  | #{@board[4]}  | #{@board[5]} "
    puts '---------------'
    puts " #{@board[6]}  | #{@board[7]}  | #{@board[8]} "
  end

  # get the users choice of symbol X or O
  def get_user_choice
    puts "Do you want to be X or O?"
    puts "Type 'X' or 'O': "
    # assign the choice to a variable
    @symbol = gets.chomp
    # call the method to then get the computers symbol for the game
    get_computer_choice
  end

  # get the computers symbol
  def get_computer_choice
    # if the users symbol is x, the computer's is o
    if @symbol.match? "X"
    @computer_symbol = "O"
    # else the computer's symbol is x, assign to variable
    else 
    @computer_symbol = "X"
    end
  end

  # check if user is a winner, loser, or draw
  def check_game_status
    # create all winning combinations in a variable using an array
    winning_combos = [[@board[0],@board[1],@board[2]], [@board[3],@board[4],@board[5]], [@board[6],@board[7],@board[8]], [@board[0],@board[3],@board[6]], [@board[1],@board[4],@board[7]], [@board[2],@board[5],@board[8]], [@board[0],@board[4],@board[8]], [@board[2],@board[4],@board[6]] ]
    # if the winning combinations include all "X"'s then you won
    if winning_combos.include? ([@symbol, @symbol, @symbol])
      display_board
      puts "Winner!"
      exit
    # if the winning combinations include all "O"'s the computer won.
    elsif winning_combos.include? ([@computer_symbol, @computer_symbol, @computer_symbol])
      display_board
      puts "You lose. Better luck next time!"
      exit
    # check if the game is a tie/draw
    elsif  @board.all? {|i| i == "X" || i == "O"}
      display_board
      puts "It's a draw. Try again."
      exit
    else
    # if none of these then continue playing the game
    play_game
    end
  end

  # method that loops through players turn
  def users_turn
    puts "Please choose a square to play (1-9): "
    # take in users input and assign to a variable
    users_choice = gets.chomp.to_i
    # subtract 1 from the choice to match the array
    users_choice -= 1
    # assign the choice integer to i for index
    i = users_choice
    # check that the index is blank 
    if @board[i] == " "
    # assign "X" to the index of array space chosen
    @board[i] = @symbol
    # otherwise start over
    else users_turn
    end
    check_game_status
    play_game
  end

  # method for the computers turn
  def computer_turn
    # get a random number (1-9) for the computers choice
    computer_choice = rand(9)
    # assign the choice to i for the index
    i = computer_choice
    # if that index in the array is blank replace with computer's symbol
    if @board[i] == " "
       @board[i] = @computer_symbol
    # if its not blank start at the beginning
    else
      computer_turn
    end
    check_game_status
    play_game
  end

  # method for determining who's turn it is
  def player_turn
    # if the board has more x's then it is the computer's turn
    if @board.count(@symbol) > @board.count(@computer_symbol)
      computer_turn
    else
     users_turn
    end
  end

  # method to loop through methods to create game
  def play_game
    loop do
      puts "\n\n"
      display_board
      player_turn
      check_game_status
    end
  end

  # call the main methods from class
  new_game = TicTacToeGame.new
  new_game.get_user_choice
  new_game.play_game
end