class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    player1_move = player1.last
    player2_move = player2.last

    raise NoSuchStrategyError.new("Strategy must be one of R,P,S") unless valid_move(player1_move) && valid_move(player2_move)

    return player1 if player1_move == player2_move

    if player1_move == 'R'
      player2_move == 'S' ? player1 : player2
    elsif player1_move == 'S'
      player2_move == 'P' ? player1 : player2
    else #player1 move is 'P'
      player2_move == 'R' ? player1 : player2
    end

  end

  def self.valid_move(move)
    move == 'R' || move == 'S' || move == 'P'
  end

  def self.tournament_winner(tournament)
    #Base case: [['Joe','R'],['Jack','P']]
    if tournament.first.first.is_a?(Array) 
      player1 = self.tournament_winner(tournament.first)
      player2 = self.tournament_winner(tournament.last)
    else
      player1 = tournament.first
      player2 = tournament.last
    end

    self.winner(player1, player2)
  end

end
