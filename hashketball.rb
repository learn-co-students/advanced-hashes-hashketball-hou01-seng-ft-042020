require "pry"


# Write your code below game_hash
def game_hash # main hash
  {
    home: { #key of main hash - its value is a hash
      team_name: "Brooklyn Nets", #key of home - holds a string
      colors: ["Black", "White"], #key of home - holds an array of strings
      players: [  #key of home - holds an array of hashses
        {   # array location 0 - holds player HOME TEAM
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {   # array location 1 - holds player HOME TEAM
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {   # array location 2 - holds player HOME TEAM
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {   # array location 3 - holds player HOME TEAM
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        { # array location 4 - holds player HOME TEAM
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {   #key of main hash - its value is a hash
      team_name: "Charlotte Hornets", #key of away - holds a String
      colors: ["Turquoise", "Purple"],  #key of away - holds an array of strings
      players: [ #key of away - holds an array of hashes
        {   # array location 0 - holds player AWAY TEAM
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        { # array location 1 - holds player AWAY TEAM
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {   # array location 2 - holds player AWAY TEAM
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {   # array location 3 - holds player AWAY TEAM
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {   # array location 4 - holds player AWAY TEAM
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here


# rspec spec/hashketball_spec.rb:97
def num_points_scored(name) #PASS
  #returns number of points scored by that player
  points_scored = 0

  game_hash.each do |location, team_info| #location:key=home/away  teamInfo:value
    game_hash[location][:players].each do |count|   #issolating the players array (the hash)
      if count[:player_name].to_s == name
        points_scored = count[:points]
      end
    end
  end
  return points_scored
end

# def num_points_scored(name) #PASS
#   #returns number of points scored by that player
#   points_scored = 0
#   players_array = []  #creates a temp array
# game_hash.each do |location, team_info| #location: home/away(key of hash) team/info(hash that is value of game_hash)
#   players_array = game_hash[location][:players] #pulls array of PLAYERS from current location into temp array
#   players_array.each do |count|   #runs thru each location of temp array
#     #count is the current location in temp away - aka each player
#     if count[:player_name].to_s == name  #checks if the current player matches the given player
#       points_scored = count[:points]  #if yes, assigns that (count in array location)player's points
#     end
#   end
# end
# return points_scored
# end


# rspec spec/hashketball_spec.rb:114
def shoe_size(name) #PASS
#returns shoe size of that players_name
  shoe_size = 0
players_array = []
game_hash.each do |location, team_info|
  players_array = game_hash[location][:players]
  players_array.each do |count|
    if count[:player_name].to_s == name
      shoe_size = count[:shoe]
    end
  end
end
return shoe_size
end


# rspec spec/hashketball_spec.rb:131
def team_colors(team_name)  # PASS
#returns an Array of that team's colors
  team_colors = []
  home_team = game_hash[:home][:team_name]
  away_team = game_hash[:away][:team_name]
  if team_name == home_team
    team_colors = game_hash[:home][:colors]
  elsif team_name == away_team
    team_colors = game_hash[:away][:colors]
  end
  return team_colors
end


# rspec spec/hashketball_spec.rb:143
def team_names # PASS
#operates on the game hash to return an Array of the team names
  names = []
   names[0] = game_hash[:home][:team_name]
   names[1] = game_hash[:away][:team_name]

# game_hash.each do |locations, team_info|
#   binding.pry
#   team_info.each do |info|
#   names << [:team_name]
#   binding.pry
#   end
# end

  return names
end


# rspec spec/hashketball_spec.rb:155
def player_numbers(team)
#returns an Array of the jersey numbers for that team_name
  jersey_numbers = []
  players_array = []

  if game_hash[:home][:team_name] == team
    players_array = game_hash[:home][:players]
  elsif game_hash[:away][:team_name] == team
    players_array = game_hash[:away][:players]
  else
    return "Team not found"
  end

  players_array.each do |count|
    jersey_numbers << count[:number]
  end

  return jersey_numbers
end



# rspec spec/hashketball_spec.rb:167
def player_stats(players_name)  # PASS
#returns a hash of that player's stats
player_stats = {}
players_array = []

game_hash.each do |location, team_info|
  game_hash[location][:players].each do |count|
  # players_array = game_hash[location][:players]
  # players_array.each do |count|
    if count[:player_name].to_s == players_name
      player_stats = count
    end
  end
end
return player_stats
end

# rspec spec/hashketball_spec.rb:183
def big_shoe_rebounds
#returns the number of rebounds associated with the player that has the largest shoe size
#break it down into steps:
#First, find the player with the largest shoe size
#Then, return that player's number of rebounds
#Remember to think about return values here
player_with_largest_shoe = " "
temp_shoe_size = 0
rebounds = 0

game_hash.each do |location, team_info|
  game_hash[location][:players].each do |count|
    if count[:shoe] > temp_shoe_size
      temp_shoe_size = count[:shoe]
    #  player_with_largest_shoe = count[:player_name]
      rebounds = count[:rebounds]
    end
  end
end
return rebounds
end

#BONUS QUESTIONS:
def most_points_scored
#which player has the most points? call this method
  player_with_most_points = " "
  most_points = 0

  game_hash.each do |location, team_info|
    game_hash[location][:players].each do |count|
      if count[:points] > most_points
        most_points = count[:points]
        player_with_most_points = count[:player_name]
      end
    end
  end
return player_with_most_points
end

def winning_team
#which team has the most points? call this method
  home_points = 0
  away_points = 0
  winning_team = " "

  game_hash[:home][:players].each do |count|
    home_points += count[:points]
  end

  game_hash[:away][:players].each do |count|
    away_points += count[:points]
  end

  if home_points > away_points
    winning_team = game_hash[:home][:team_name]
  elsif away_points > home_points
    winning_team = game_hash[:away][:team_name]
  end

return winning_team
end


def player_with_longest_name
#which player has the longest name? call this method

#make a new array & then sort names by length?

end

#SUPER BONUS
def long_name_steals_a_ton
#write a method that returns true if the player with the
#longest name had the most steals. call this method

#first call player_with_longest_name method


end
