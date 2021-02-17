class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    active = []
    @teams.each do |team|
      if not team.eliminated?
        active << team.players_by_position(position)
      end
    end
    active.flatten
  end

  def all_players_by_position
    all_pbp = Hash.new
    @teams.each do |team|
      team.players.each do |player|
        all_pbp[player.position] = player
      end
    end
    all_pbp
  end
end
