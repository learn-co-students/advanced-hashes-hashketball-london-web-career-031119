require 'pry'

def game_hash 
  {
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
        }
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
        }
      } 
    }
  }
end 

def num_points_scored(player_name)
  new_array = []
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, skills_hash|
          if player == player_name
            new_array << skills_hash[:points]
          end 
      end 
    end 
  end 
end 
new_array.join.to_i 
end 

def shoe_size(player_name)
  new_array = []
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, skills_hash|
          if player == player_name
            new_array << skills_hash[:shoe]
          end 
      end 
    end 
  end 
end 
new_array.join.to_i 
end 

def team_colors(team_name)
  new_array = []
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if data == team_name
      new_array << team_data[:colors]
      end 
    end 
  end
new_array.flatten
end 

def team_names
  new_array = []
  game_hash.each do |location, team_data|
   new_array << team_data[:team_name]
  end 
  new_array
end 

def player_numbers(team_name)
  new_array = []
  game_hash.map do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.map do |attribute, data|
        if attribute == :players
        data.map do |player, skills_hash|
          new_array << skills_hash[:number]
        end 
      end 
      end 
    end 
  end
  new_array
end 

def player_stats(player_name)
  new_array = []
  game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
      if attribute == :players
        data.map do |player, skills_hash|
          if player == player_name
            new_array << skills_hash
          end 
      end 
    end 
  end 
end 
new_array.reduce
end 

def big_shoe_rebounds
shoe_size = 0
rebound = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, skills_hash|
          if skills_hash[:shoe] > shoe_size
            shoe_size = skills_hash[:shoe]
            rebound = skills_hash[:rebounds]
          end 
        end 
      end 
    end 
  end 
  rebound
end

def most_points_scored
  points = 0 
  player = "anon"
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attributes|
      if attributes[:points] > points
        points = attributes[:points]
        player = name 
      end 
    end 
  end
  player 
end

def winning_team
  home_total = 0 
  game_hash[:home][:players].each do |name, data|
    home_total = home_total + data[:points] 
  end
  
  away_total = 0
  game_hash[:away][:players].each do |name, data|
    away_total = away_total + data[:points] 
  end 
  
  if home_total > away_total
    game_hash[:home][:team_name]
  else 
    game_hash[:away][:team_name]
  end 
end 

def player_with_longest_name
  player_name_length = 0
  player_name = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attributes|
      if name.length > player_name_length
        player_name_length = name.length
        player_name = name 
      end 
    end 
  end
  player_name 
end

def long_name_steals_a_ton?
  steals = 0
  player_name = "anon"
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |name, attributes|
      if attributes[:steals] > steals
        player_name = name
      end 
    end 
  end
  return true if player_name == player_with_longest_name 
end 
