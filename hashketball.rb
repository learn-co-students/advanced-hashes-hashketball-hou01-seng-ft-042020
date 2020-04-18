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

def get_players
  player_array = game_hash[:home][:players] + game_hash[:away][:players]
  player_array
end

def num_points_scored(player_input)
  # array = get_players
  # count = 0
  # while count < array.length do
  #   array[count].each do |data,value|
  #     if value == player_name
  #       array[count][:points]
  #     end
  #   end
  #   count += 1
  # end
  
  # array = get_players
  #   array.each do |player|
  #     player.each do |key , value|
  #       if key[value] == player_input
  #       5
  #       end
  #     end
  #   end
  
  # it took me forever to get this simple one because I messed
  # my helper method above
  # maybe I expected array[count][:points] to return without typing "return"... 
  # I suppose that's because it's a temporary value or something?
 
  get_players.each do |player|
    if player[:player_name] == player_input
      return player[:points]
    end
  end
end

def shoe_size(player_input)
  get_players.each do |player|
    if player[:player_name] == player_input
      return player[:shoe]
    end
  end
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  else
    "What is basketball?"
  end
end

def team_names
  array = [game_hash[:home][:team_name],game_hash[:away][:team_name]]
  array
end

def player_numbers(team)
  array = []
  if game_hash[:home][:team_name] == team
   game_hash[:home][:players].each do |player|
      array << player[:number]
    end
  elsif game_hash[:away][:team_name] == team
    game_hash[:away][:players].each do |player|
      array << player[:number]
    end
  end
  array
end

def player_stats(player_input)
  get_players.each do |player|
    if player[:player_name] == player_input
      return player
    end
  end
  # I kept trying to do this by returning a new hash that
  # didn't have the :player_name key/val pair. Oops.
end

def big_shoe_rebounds
  big_shoe = 0
  array = get_players
  array.each do |player|
    if player[:shoe] > big_shoe
      big_shoe = player[:shoe]
    end
  end
  array.each do |player|
    if player[:shoe] == big_shoe
      return player[:rebounds]
    end
  end
end
