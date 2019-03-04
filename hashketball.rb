# Write your code here!

def game_hash
team_stats = {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"], 
    :players => { 
      "Alan Anderson" => {
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
      },
      "Reggie Evans" => {
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
      },
      "Brook Lopez" => {
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
      },
      "Mason Plumlee" => {
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
      },
      "Jason Terry" => {
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise", "Purple"], 
    :players => { 
      "Jeff Adrien" => {
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
      },
      "Bismak Biyombo" => {
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 7,
      :blocks => 15,
      :slam_dunks => 10
      },
      "DeSagna Diop" => {
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5 
      },
      "Ben Gordon" => {
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
      },
      "Brendan Haywood" => {
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 22,
      :blocks => 5,
      :slam_dunks => 12
      }
    }
  }
}
end


def num_points_scored(player)
  scores = game_hash
  scores.each do |side, team_properties| 
   team_properties.each do |team_info, value| 
     if value.include?(player) 
    # value.each do |key, values|
      #if key == :points
      # values.each do |keys, vals|
        return scores[side][team_info][player][:points]
      end
    end
  end
end



# def points_function () 
#   team_stats[:home].each do |key, value|
#     puts key 
#   end 
# end 



def shoe_size(players_name)
  size = game_hash
  size.each do |side, team_properties| 
   team_properties.each do |team_info, value| 
     if value.include?(players_name) 
        return size[side][team_info][players_name][:shoe]
      end
    end
  end
end


def team_colors(team_color)
  color = game_hash
  array = Array.new
  color.each do |sides, team_properties|
    if team_properties.values.include?(team_color)
      team_properties.each do |key, value|
        if key == :colors
      return value
    end
    end
    end
  end
end


def team_names
  name = game_hash
  array = Array.new
  name.each do |sides, team_properties|
    team_properties.each do |key, value|
    if key == :team_name
     array << value
    end
    end
  end
  array
end


def player_numbers(num)
  numbers = game_hash
  array = Array.new
  numbers.each do |side, team_properties| 
    if team_properties.values.include?(num)
   team_properties.each do |team_info, player_info|
     if team_info == :players
     player_info.each do |team, player|
       player.each do |key, value|
     if key == :number
        array << value
      end
    end
       end
      end
      end
    end
  end
  array
end

def player_stats(info)
  stats = game_hash
  stats.each do |side, team_properties|
    team_properties.each do |team_info, player_info|
      if player_info.include?(info)
      return stats[side][team_info][info]
    end
  end
    end
end

def big_shoe_rebounds
  shoe_rebounds = game_hash
  shoe_number = 0
  person = ""
  shoe_rebounds.each do |side, team_properties|
    team_properties.each do |team_info, player_info|
      if team_info == :players
        player_info.each do |players, info|
          info.each do |key, value|
          if key == :shoe
            if shoe_number < value
              person = players
              value = shoe_number
              return shoe_rebounds[side][team_info][person][:rebounds]
            end
            end
          end
        end
      end
    end
  end
end

# def most_points_scored
#   most_points = game_hash
#   num = 0
#   person = ""
#   most_points.each do |side, team_properties|
#     team_properties.each do |team_info, player_info|
#       if team_info == :players
#         player_info.each do |players, info|
#           info.each do |key, value|
#             if key == :points
#               if num < value
#                 person = players
#                 num = value
#               return most_points[side][team_info][person]
#             end
#             end
#           end
#         end
#       end
#     end
#   end
# end
