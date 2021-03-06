class SpGame

  attr_reader :player_1, :computer, :result

  def self.start_an_sp_game(player_name)
    @current_sp_game = SpGame.new(player_name)
  end

  def self.current_sp_game
    @current_sp_game
  end

  def initialize(player_name)
    @player_1 = Player.new(player_name)
    @computer = Player.new('Computer')
  end

  def play_sp
    @computer.make_choice
    @result = compare_sp
  end

  def compare_sp
    return 'It was a draw!!!' if @player_1.choice == @computer.choice
    return "#{@player_1.name} has won!!!" if win?

    return "Unlucky, #{@computer.name} has beaten you :( !!!"
  end

private

  def win?
    a = @player_1.choice == 'Rock' && @computer.choice == 'Scissors'
    b = @player_1.choice == 'Paper' && @computer.choice == 'Rock'
    c = @player_1.choice == 'Scissors' && @computer.choice == 'Paper'
    return true if a || b || c
    return false
  end
end
