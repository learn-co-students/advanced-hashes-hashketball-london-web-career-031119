require "pry"

def game_hash
  the_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans": {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez": {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee": {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry": {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      },
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien": {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo": {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop": {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon": {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood": {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      },
    }
  }
end

def team #ARRAY with 2 hashes
  game_hash.values
end

def find_team(team_name) #HASH team_name: "", ..., slam_dunks
  #team.ARRAYENUM { |a_hash| a_hash.HASHENUM }
  team.find {|team| team[:team_name] == team_name}
end
# USAGE: find_team(team_name)[:colors] => ["T", "P"]
# USAGE: find_team(team_name)[:players] => {10 names as keys}

def players #HASH with 10 keys -> regardless of teams. Set up for more than 2 teams.
  n=1
  all_players = {}
  loop do
    all_players = team[n-1][:players].merge(team[n][:players])
    n += 1
    break if n == team.length
  end
  all_players
end
#USAGE players[player_name_input.to_sym] returns {:number, ..., :slam_dunks}
#USAGE players[player_name_input.to_sym][:number] returns 0

def num_points_scored(a_name)
  players[a_name.to_sym][:points]
end

def shoe_size(a_name)
  players[a_name.to_sym][:shoe]
end

def team_colors(team_name)
  find_team(team_name)[:colors]
end

def team_names
  team_names_result = []
  team.each {|team| team_names_result << team[:team_name]}
  team_names_result
end

def player_numbers(team_name) #returns ARRAY > could use array.collect method OR others
  team_player_stats = []
  team_players_stats = find_team(team_name)[:players].values #array of just the 5 final level Hashes
  team_players_stats.collect {|stats_hash| stats_hash[:number]}
end

def player_stats(a_name)
  players[a_name.to_sym]
end

def big_shoe_rebounds
  #find the biggest shoe size from PLAYERS
  biggest_shoe_size = ""
  biggest_shoe_size = players.collect {|name,stat_hash| stat_hash[:shoe]}.max
  #find which player owns this shoe size
  big_shoe_player = ""
  big_shoe_player = players.select {|name,stat_hash| stat_hash[:shoe] == biggest_shoe_size}.keys[0]
  #feed into the final formula
  players[big_shoe_player][:rebounds]
end

#OLD METHOD
#def shoe_size(a_name) #knows the shoe size of each player
#  shoe_size_result = ""
#  game_hash.each do |location,team_data|
#    team_data.each do |attribute,data|
#      if data.class == Hash
#        data.each do |player_name, player_data|
#          if a_name.to_sym == player_name
#              shoe_size_result = player_data[:shoe]
#          end
#        end
#      end
#    end
#  end
#  shoe_size_result
#end

####Additional unused method
#def is_name_at_home(name)
#  game_hash.dig(:home,:players,name.to_sym) == false
#end
#call is_name_at_home == false

# OLD METHOD
#def team_names #returns the team names << The old method
#  team_names_result = []
#  game_hash.each do |location, team_data| #:home{} ; :away{}
#    team_data.each do |attribute, attribute_data| # :team_name"" ; :colors[] ; :players{}
#      if attribute == :team_name
#        team_names_result << attribute_data
#      end
#    end
#  end
#  team_names_result
#end

# OLD METHOD
#def team_colors(team_name) #knows the Brooklyn Nets colors are Black and White
#  team_colors_result = []
#  game_hash.each do |location,team_data| #:home{} ; :away{}
#    if team_name == team_data[:team_name]
#      team_colors_result = team_data[:colors]
#    end
#  end
#  team_colors_result
#end

# OLD METHOD
#def num_points_scored(a_name) #knows the number of points scored by each player
#  points_scored_result = ""
#  game_hash.each do |location,team_data|
#    team_data.each do |attribute,data|
#      if data.class == Hash
#        data.each do |player_name, player_data|
#          if a_name.to_sym == player_name
#              points_scored_result = player_data[:points]
#         end
#      end
#      end
#    end
#  end
#  points_scored_result
#end
