#!/usr/bin/env ruby
# frozen_string_literal: true
$global = 545454
$first_row = %w[_ _ _]
$second_row = %w[_ _ _]
$third_row = %w[_ _ _]

$letter = ""
$player_one = ""
$player_two = "--"
$current_player = true

$board = [$first_row, $second_row, $third_row]

def welcome
  puts 'Welcome to the Tic Tac Toe game!'
  puts 'do you want to proceed? (y/n)'
  user_answer = gets.chomp.downcase
  if user_answer.match(/y/)
    true
  elsif user_answer.match(/n/)
    puts 'bye'
    false
  else
    puts 'wrong answer'
    welcome
  end
end

def instructions
  puts "Instructions:\n 1)The game is played on a grid that's 3 squares by 3 squares.\n
 2)Write a letter from A to C and a number from 1 to 3 to select the row and the column respectively that you want to play on.\n
 3)Player 1 is X, player 2 is O.\n
 4)Once a player gets 3 marks in a row (up, down, across, or diagonally) is the winner.\n
 5)If all 9 squares are full, the game is over \n \n"
end

def players_setting
  puts "Okay master! May I have first player's name?"
  user_answer = gets.chomp
  # some validation
  player_one  = user_answer
  puts "cool! what about second player's name?"
  user_answer = gets.chomp
  # some validation
  player_two = user_answer
end

def user_choice
  puts 'Write a letter from A to C and a number from 1 to 3'
  payer_call = gets.chomp.upcase
  round
  if payer_call.include? 'A'
    if payer_call.include? '1'
      $board[0][0] = $letter
    elsif payer_call.include? '2'
      $board[0][1] = $letter
    elsif payer_call.include? '3'
      $board[0][2] = $letter
    end
  elsif payer_call.include? 'B'
    if payer_call.include? '1'
      $board[1][0] = $letter
    elsif payer_call.include? '2'
      $board[1][1] = $letter
    elsif payer_call.include? '3'
      $board[1][2] = $letter
    end
  elsif payer_call.include? 'C'
    if payer_call.include? '1'
      $board[2][0] = $letter
    elsif payer_call.include? '2'
      $board[2][1] = $letter
    elsif payer_call.include? '3'
      $board[2][2] = $letter
    end
  else
    puts 'Please write a letter from A to C followed by a number from 1 to 3'
  end
end

def board_matrix
  puts "#{$board[0][0]} #{$board[0][1]} #{$board[0][2]}"
  puts "#{$board[1][0]} #{$board[1][1]} #{$board[1][2]}"
  puts "#{$board[2][0]} #{$board[2][1]} #{$board[2][2]}"
end

def round
    pp "ghghghghghghghghghghghghghghghghghghgh"
  if $current_player 
    $current_player = false
    pp $current_player
    $letter = "O"
  else
    $current_player = true
    $letter = "x"
  end
end

# game starts

while 1
    #welcome
    break unless welcome
    instructions
    players_setting
    board_matrix
    user_choice
    board_matrix
    user_choice
    board_matrix
end

# def alter_matrix(#return_from_user_choice_methoid, #some_other_vair_depde_on_cur_player )
#     board[][] = ()
# end

# board[0][0] = "X"


