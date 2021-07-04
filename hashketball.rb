require 'pry'
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
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
        {
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
        {
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
        {
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
        {
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
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
        {
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
        {
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
        {
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
        {
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
def num_points_scored(player_name_input)
  
  if find_player_stat(:home, player_name_input, :points) 
    return find_player_stat(:home, player_name_input, :points) 
  else 
    return find_player_stat(:away, player_name_input, :points)
  end 
end 

def shoe_size(player_name_input)
  
  if find_player_stat(:home, player_name_input, :shoe) 
    return find_player_stat(:home, player_name_input, :shoe) 
  else 
    return find_player_stat(:away, player_name_input, :shoe)
  end 
end 

def find_player_stat(home_or_away, player_name_input, stat_type)
  
  game_hash[home_or_away][:players].each do |hash|
    if hash[:player_name] == player_name_input
      return hash[stat_type]
    end 
  end 
  nil 
end

def team_colors(team_name_input)
  if game_hash[:home][:team_name] == team_name_input
    return game_hash[:home][:colors]
  else 
    # game_hash[:away][:team_name] == team_name_input
    return game_hash[:away][:colors]
  end 
end

def team_names
  names = []
  names << game_hash[:home][:team_name]
  names << game_hash[:away][:team_name]
  names 
end

def player_numbers(team_name_input)
#return array of player numbers for team name given
  if game_hash[:home][:team_name] == team_name_input
    return jersey_array(:home)
  else 
    #game_hash[:away][:team_name] == team_name_input
    return jersey_array(:away)
  end 
end 

def jersey_array(home_or_away)
  array_of_jersey_numbers = []
  game_hash[home_or_away][:players].map do |player|
    array_of_jersey_numbers << player[:number]
  end 
  array_of_jersey_numbers
end 

def player_stats(player_name_input)
  if find_player(:home, player_name_input)
    return find_player(:home, player_name_input)
  else 
    return find_player(:away, player_name_input)
  end 
end

def find_player(home_or_away, player_name_input)
  game_hash[home_or_away][:players].map do |player|
    if player[:player_name] == player_name_input
        return player 
    end 
  end 
  nil 
end 

#GOOD CODE ENDS HERE 
def big_shoe_rebounds
  #iterate home
  home_player = find_biggest_player(:home)
  #iterate away
  away_player = find_biggest_player(:away)
  #compare values
  #binding.pry
  if home_player[1] > away_player[1]
    return find_player_stat(:home, home_player[0], :rebounds)
  else
    return find_player_stat(:away, away_player[0], :rebounds)
  end 
  #fetch that players rebound stat and return it
  
end

def find_biggest_player(home_or_away)
  person = []
  biggest_player = ""
  biggest_shoe = 0
  game_hash[home_or_away][:players].map do |player|
    if player[:shoe] > biggest_shoe
      biggest_player = player[:player_name]
      biggest_shoe = player[:shoe]
    end 
  end
  person[0] = biggest_player
  person[1] = biggest_shoe
  person 
  #returns array with element 0 being the name and element 1 being the size 
end 

=begin 
def find_player_stat(home_or_away, player_name_input, stat_type)
  
  game_hash[home_or_away][:players].each do |hash|
    if hash[:player_name] == player_name_input
      return hash[stat_type]
    end 
  end 
  nil 
end
 
game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
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
        {
=end 