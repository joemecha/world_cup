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
    all_pbp = Hash.new {|hash, key| hash[key] = []}
    all_p = []
    teams.each do |team|
      team.players.each do |player|
        all_p << player
      end
    end
    all_p.each do |player|
      all_pbp[player.position] << player
    end
    all_pbp
  end
end
