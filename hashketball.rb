require "pry"

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
# p game_hash[:away][:players]

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    # binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        # binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            # binding.pry
      end
    end
  end
end

# good_practices
def num_points_scored(score)
 result = []   # create new result array
game_hash.each do |one, two| #iterate into hash
  if two[:players].include?(score)
  result << two[:players][score][:points]    #if while iterating through hash it finds the name, then shovel matching score into array
 # p game_hash[:home][:players]["Alan Anderson"][:points]
#
# if team_data[:players] = match
# p data[team_data][:players]
end
end
result.join.to_i # use method chain to change result array to string and then to integer
end


# p num_points_scored("Ben Gordon")
def shoe_size(name)
  result = []      # new array
  game_hash.each do |one, two|   #iterate through hash
  if two[:players].include?(name)
  result << two[:players][name][:shoe]      #if while iterating through hash it finds the name, then shovel matching shoe size into array
 # p game_hash[:home][:players]["Alan Anderson"][:points]
#
# if team_data[:players] = match
# p data[team_data][:players]
end
end
result.join.to_i
end

def player_numbers(team)
  result = []    #new array
  game_hash.each do |one, two|
    if two[:team_name].include?(team)
      two[:players].each do |three, four| #iterate through hash, when it finds team name then iterate further to get all corresponding player numbers and shovel those into array
      result << four[:number]
end
end
end
 result
end

#player_numbers("Charlotte Hornets")


def team_colors(name)
result = []      #new array
game_hash.each do |one, two|
if two[:team_name].include?(name)  #iterate through hash, when it finds team name, shovel team colors into result array
result << two[:colors]

end
end
result.flatten #use .flatten method to change multiple arrays in result to single array
end
# p result

# p team_colors("Charlotte Hornets")
# end
def player_stats(name)
  result = []
 game_hash.each do |one, two|
   if two[:players].include?(name)    #iterate through hash, when find name, take hash or players stats and assign it to result
result = two[:players][name]
  # p game_hash[:home][:players]["Alan Anderson"][:points]
 #
 # if team_data[:players] = match
 # p data[team_data][:players]
 end
 end
 result
end

#p player_stats("Reggie Evans")


def team_names
  name = []
game_hash.each do |one, two|
  name << two[:team_name]      #iterate through hash and shovel team names into name array
end
name #output name array
end

def big_shoe_rebounds
result = []
big = 0   #create variable to store/compare shoe sizes
 shoes = "" #create variable to store name largest shoe size
game_hash.each do |one, two|
  two[:players].each do |name, stats|
  if stats[:shoe] > big     # iterate though hash. because big starts at 0, first iteration takes first shoe size and places it into big variable.
    big = stats[:shoe]      #the following iterations it will compare shoe size with previous high. if compared is highest then place player name into shoes variable
    shoes = name
end
end
game_hash.each do |x, y|
if y[:players].include?(shoes)
 result << y[:players][shoes][:rebounds]    #iterate through hash again to shovel rebound score of player previously stored in shoes variable
end
end
end
result[0] #ouputs first result of result array
end
