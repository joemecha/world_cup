require 'minitest/autorun'
require 'minitest/pride'
require './lib/world_cup'
require './lib/team'
require './lib/player'

class WorldCupTest < Minitest::Test
  def test_it_exists_and_has_attributes
    worldcup = WorldCup.new(2018, "Japan")
    assert_instance_of WorldCup, worldcup
  end

  def test_year
    worldcup = WorldCup.new(2018, "Japan")

    assert_equal 2018, worldcup.year
  end

  def test_teams
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])

    assert_equal [france, croatia], world_cup.teams
  end

  def test_active_players_by_position # fails but expected == actual
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])
    expected = [pogba, modric]

    assert_equal expected, world_cup.active_players_by_position("midfielder")
  end

  def test_player_inactive_if_team_eliminated # fails but expected == actual
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])
    croatia.eliminated
    expected = [pogba]

    assert_equal expected, world_cup.active_players_by_position("midfielder")
  end

  def test_all_players_by_position
    france = Team.new("France")
    mbappe = Player.new({name: "Kylian Mbappe", position: "forward"})
    pogba = Player.new({name: "Paul Pogba", position: "midfielder"})
    france.add_player(mbappe)
    france.add_player(pogba)

    croatia = Team.new("Croatia")
    modric = Player.new({name: "Luka Modric", position: "midfielder"})
    vida = Player.new({name: "Domagoj Vida", position: "defender"})
    croatia.add_player(modric)
    croatia.add_player(vida)

    world_cup = WorldCup.new(2018, [france, croatia])
    p world_cup.all_players_by_position

    assert_equal #what here , world_cup.all_players_by_position
  end

end
