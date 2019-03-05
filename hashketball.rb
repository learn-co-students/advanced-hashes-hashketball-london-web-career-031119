require 'pry'

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players:{
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Regie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(name)

  points = []
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])

  all_players.collect do |player, stats|
    if name.to_sym == player
      points << all_players[player][:points]
      points[0]
    end
  end
  points.compact
end

=begin First, I had done it through nested iterations

  array =[]
  game_hash.collect do |team, specs|
    specs.collect do |specs, values|
      if specs == :players
        values.collect do |player, value|
          if player.to_s == name
            value.collect do |key, int|
              if key == :points
                array << int
              end
            end
          end
        end
      end
    end
  end
  array
  #tried array[0] and it didn't work
end

=end

def shoe_size(name)

  shoe = []
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])

  all_players.collect do |player, stats|
    if name.to_sym == player
      shoe << all_players[player][:shoe]
    end
  end
  shoe.compact
end


=begin First, I had done it through nested iterations.
  array =[]
  game_hash.collect do |team, specs|
    specs.collect do |specs, values|
      if specs == :players
        values.collect do |player, value|
          if player.to_s == name
            value.collect do |key, int|
              if key == :shoe
                array << int
              end
            end
          end
        end
      end
    end
  end
  array
  #tried array[0] and it didn't work
end

=end

def team_colors(team_name)
  colors = []
  game_hash.collect do |team, details|
    details.collect do |specs, values|
      if values.to_s == team_name
        colors << details[:colors]
      end
    end
  end
  colors.compact
  colors[0]
end

def team_names
  names = []
  game_hash.collect do |team, details|
    details.collect do |key, value|
      if key == :team_name
        names << value
      end
    end
  end
  names
end

def player_numbers(team_name)
  numbers = []
  game_hash.collect do |team, specs|
    specs.collect do |key, value|
      if value == team_name
        specs.collect do |specs, values|
          if specs == :players
            values.collect do |player, stats|
              numbers << stats[:number]
            end
          end
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  player_stats = []
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
  all_players.collect do |player, stats|
    if player.to_s == name
      player_stats << stats
    end
  end
  player_stats.compact
end

=begin This is how I had tried to build the method at first, through nested iterations.

stats = []
  game_hash.collect do |team, specs|
    specs.collect do |key, value|
      if key == :players
        value.collect do |player, data|
          if player.to_s == name
          stats <<  data
          else
            array = []
          end
        end
      end
    end
  end
  stats
end

=end

def big_shoe_rebounds
  all_players = game_hash[:home][:players].merge(game_hash[:away][:players])
    player_biggest_shoe = all_players.max_by {|key, value| value.fetch(:shoe)}[0]
    all_players[player_biggest_shoe][:rebounds]
end
