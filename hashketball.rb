# Write your code here!
require "pry"

def game_hash
  hash = {
   :home => {
             :team_name => "Brooklyn Nets",
             :colors => ["Black","White"],
             :players =>{
               "Alan Anderson"=>{ :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
               "Reggie Evans"=>{ :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 },
               "Brook Lopez"=>{ :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 },
               "Mason Plumlee"=>{ :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 },
               "Jason Terry"=>{ :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }
              }
            },
   :away => {
             :team_name => "Charlotte Hornets",
             :colors =>["Turquoise","Purple"],
             :players => {
               "Jeff Adrien"=>{ :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 },
               "Bismak Biyombo"=>{ :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10 },
               "DeSagna Diop"=>{ :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 },
               "Ben Gordon"=>{ :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
               "Brendan Haywood"=>{ :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12 }
                         }
            }

  }
end
=begin
Build a method, num_points_scored that takes in an argument of a player's name and returns the number of points scored for that player.
Think about where in the hash you will find a player's
:points.
How can you iterate down into that level?
Think about the return value of your method.
Remember that .each returns the original collection that you are iterating over.
How can you return the number of points for a particular player?
=end
def num_points_scored(players_name)

game_hash.each do #1
  |team,data|
  #binding.pry
data.each do #2
  |general,info|
   if general == :players #3
  #binding.pry
    info.each do #4
    |players,stats|
    #binding.pry
     if players == players_name #5
       #binding.pry
       stats.each do
         |k,y|
         #binding.pry
         if k ==:points
           return y
           end
       end

    end#5
  end#4
  end #3
 end #2
end #1
end
num_points_scored("Jeff Adrien")
#binding.pry


def shoe_size(players_name)
  game_hash.each do #1
    |team,data|
    #binding.pry
  data.each do #2
    |general,info|
     if general == :players #3
    #binding.pry
      info.each do #4
      |players,stats|
      #binding.pry
       if players == players_name #5
         #binding.pry
         stats.each do
           |k,y|
           #binding.pry
           if k ==:shoe
             return y
             end
         end

      end#5
    end#4
    end #3
   end #2
  end #1
end
=begin
Build a method, team_colors,
that takes in an argument of the team name and returns an array of that teams colors.
=end
def team_colors(team_names)
game_hash.collect do |team,data|
  #binding.pry
  data.each do |general,stats|
    #binding.pry
    if stats.include?(team_names) #this works
    data.each do |general_X1,stats_X2|
      if general_X1 == :colors
        y = stats_X2
        #binding.pry
        return stats_X2
      end
    end
    end
  end
 end
end
team_colors("Brooklyn Nets")
#binding.pry

=begin
Build a method, team_names, that operates
on the game hash to return an array of the team names.
=end
def team_names
  y=[]
arr = game_hash.each do |side,info|
info.each do |general,data|
    if general == :team_name
      y<<data
      #binding.pry
  end
end
end
y
end
team_names
#binding.pry
=begin
Build a method, player_numbers, that takes in
an argument of a team name and returns an array of the jersey number's for that team
=end

def player_numbers (team_names) #1
y=[]
  game_hash.collect do |team,data| #2
  #  binding.pry
    data.each do |general,stats|#3
    #  binding.pry
      if stats.include?(team_names) #this works 4
  #  binding.pry
    data.each do |general_2,stats_2| #5
    #  binding.pry
      if general_2 == :players #6
      #  binding.pry
        stats_2.each do |name,info| #7
        #  binding.pry
        info.each do |stati,figure| #8
        #  binding.pry
          if stati == :number #9
          #  binding.pry
            y<<figure
          end #9
        end #8
        end#7
      end #6
    end #5
      end #4
    end #3
  end #2
  y
end #1
player_numbers("Brooklyn Nets")
#binding.pry
=begin
Build a method, player_stats,
that takes in an argument of a player's name
and returns a hash of that player's stats.
=end
def player_stats (players_name) #1
  player_statistics = game_hash.each do |team,data| #2
    # binding.pry
      data.each do |general,stats|#3
        #binding.pry
        if general == :players #this works 4
    # binding.pry
      stats.each do |names,stats_2| #5
      # binding.pry
        if names == players_name #6
        # binding.pry
         return stats_2
      end # 6
      end #5
        end #4
      end #3
    end #2
end #1
player_stats("Reggie Evans")
#binding.pry
def big_shoe #1
  y = []
  game_hash.each do |side,info| #2
    info.each do |general,data| #3
      #binding.pry
      if general == :players #4
      #  binding.pry
        data.each do |names,stats| #5
        # binding.pry
         stats.each do |k,v| #6
           #binding.pry
           if k == :shoe #7
             y<<v
            # binding.pry
           end#7
         end #6
        end #5
      end #4
    end #3
  end #2
  i = y.max
  #binding.pry
end #1


=begin
Build a method, big_shoe_rebounds, that will return
the number of rebounds associated with the player that has the largest shoe size.
Break this one down into steps:
First, find the player with the largest shoe size
Then, return that player's number of rebounds
=end
def big_shoe_rebounds #1
  game_hash.each do |side,info| #2
    info.each do |general,data| #3
      #binding.pry
      if general == :players #4
      #  binding.pry
        data.each do |names,stats| #5
        # binding.pry
         stats.each do |k,v| #6
           #binding.pry
        if k == :shoe #7
       #binding.pry
       if v == 19 #8
         binding.pry
         stats.each do |k1,v1|
           binding.pry
           if k1 == :rebounds
              v1
           end
         end
       end
          end
         end #6
        end #5
      end #4
    end #3
  end #2
  #binding.pry
end #1
