# Write your code here!
require "pry"

def game_hash

  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        },
      }
    },

    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        },
      }
    }

  }

end

def num_points_scored(name_string)
  points = 0
  game_hash[:home][:players].each { |name, stats|
    if name == name_string
      points = stats[:points]
    end
  }

  game_hash[:away][:players].each { |name, stats|
    if name == name_string
      points = stats[:points]
    end
  }

  points
end

def shoe_size(name_string)
  size = 0

  if game_hash[:home][:players].member?(name_string)
    size = game_hash[:home][:players][name_string][:shoe]
  elsif game_hash[:away][:players].member?(name_string)
    size = game_hash[:away][:players][name_string][:shoe]
  end

  size

end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:colors]
  end
end

def team_names
  [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  result = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each { |name, stats|
      result << stats[:number]
    }
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each { |name, stats|
      result << stats[:number]
    }
  end

  result

end

def player_stats(player_name)
  if game_hash[:home][:players].member?(player_name)
    game_hash[:home][:players][player_name]
  elsif game_hash[:away][:players].member?(player_name)
    game_hash[:away][:players][player_name]
  end
end

def big_shoe_rebounds
  #stores the stats of the bigfootest so far
  biggest_foot = 0
  bigfoot_stats = {}
  game_hash[:home][:players].each { |name, stats|
    if stats[:shoe] > biggest_foot
      biggest_foot = stats[:shoe]
      bigfoot_stats = stats
    end
  }
  game_hash[:away][:players].each { |name, stats|
    if stats[:shoe] > biggest_foot
      biggest_foot = stats[:shoe]
      bigfoot_stats = stats
    end
  }

  bigfoot_stats[:rebounds]

end

def most_points_scored
  high_score = 0
  mvp = ""
  game_hash[:home][:players].each { |name, stats|
    if stats[:points] > high_score
      high_score = stats[:points]
      mvp = name
    end
  }
  game_hash[:away][:players].each { |name, stats|
    if stats[:points] > high_score
      high_score = stats[:points]
      mvp = name
    end
  }

  mvp

end

def winning_team

  home_total = 0
  away_total = 0

  game_hash[:home][:players].each { |name, stats|
    home_total += stats[:points]
  }
  game_hash[:away][:players].each { |name, stats|
    away_total += stats[:points]
  }

  if home_total > away_total
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end

end

def player_with_longest_name
  longest = 0
  player = ""
  game_hash[:home][:players].each { |name, stats|
    if name.size > longest
      longest = name.size
      player = name
    end
  }
  game_hash[:away][:players].each { |name, stats|
    if name.size > longest
      longest = name.size
      player = name
    end
  }

  player

end

def most_steals
  most_steals = 0
  mvp = ""
  game_hash[:home][:players].each { |name, stats|
    if stats[:steals] > most_steals
      most_steals = stats[:steals]
      mvp = name
    end
  }
  game_hash[:away][:players].each { |name, stats|
    if stats[:steals] > most_steals
      most_steals = stats[:steals]
      mvp = name
    end
  }

  mvp

end

def long_name_steals_a_ton?
  most_steals == player_with_longest_name
end
