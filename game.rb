require "./player"
require "./question"

class Game
  attr_accessor :current_player

  def start_game
    while players_alive?
      ask_question
      if(players_alive?)
        toggle_player
        puts "--- NEW TURN ---"
      end
    end
    game_over
  end

private

  def initialize
    @player1 = Player.new(1)
    @player2 = Player.new(2)
    @current_player = @player1
  end

  def toggle_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def ask_question
    question = Question.new
    puts "Player #{@current_player.name}: #{question.q}"
    print "> "
    input = $stdin.gets.chomp
    if question.is_correct(input) == false
      @current_player.lose_round
      puts "Player #{@current_player.name}: Seriously? No."
    else question.is_correct(input) == true
      puts "Player #{@current_player.name}: That's correct!"
    end
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def players_alive? 
    @player1.lives > 0 && @player2.lives > 0
  end

  def game_over
    toggle_player
    puts "Player #{@current_player.name} wins with a score of #{@current_player.lives}/3"  
    puts "--- GAME OVER ---"
    puts "Goodbye!"
  end
  
end
