def game_hash 
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16, 
          :points => 22, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 1
        },
        {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14, 
          :points => 12, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 12, 
          :blocks => 12, 
          :slam_dunks => 7        
        },
        {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17, 
          :points => 17, 
          :rebounds => 19, 
          :assists => 10, 
          :steals => 3, 
          :blocks => 1, 
          :slam_dunks => 15          
        },
        {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19, 
          :points => 26, 
          :rebounds => 11, 
          :assists => 6, 
          :steals => 3, 
          :blocks => 8, 
          :slam_dunks => 5          
        },
        {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15, 
          :points => 19, 
          :rebounds => 2, 
          :assists => 2, 
          :steals => 4, 
          :blocks => 11, 
          :slam_dunks => 1          
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18, 
          :points => 10, 
          :rebounds => 1, 
          :assists => 1, 
          :steals => 2, 
          :blocks => 7, 
          :slam_dunks => 2
        },
        {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16, 
          :points => 12, 
          :rebounds => 4, 
          :assists => 7, 
          :steals => 22, 
          :blocks => 15, 
          :slam_dunks => 10        
        },
        {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14, 
          :points => 24, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 4, 
          :blocks => 5, 
          :slam_dunks => 5          
        },
        {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15, 
          :points => 33, 
          :rebounds => 3, 
          :assists => 2, 
          :steals => 1, 
          :blocks => 1, 
          :slam_dunks => 0  
        },
        {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15, 
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 7, 
          :blocks => 5, 
          :slam_dunks => 12          
        }
      ]
    }
  }
end

def get_all_players
  all_players = []
  game_hash[:home][:players].map do |ele| 
    all_players << ele 
  end
  game_hash[:away][:players].map do |ele| 
    all_players << ele
  end
  all_players 
end 

def get_player_stat(player_name, player_stat)
  all_players = get_all_players
  all_players.map do |player|
    return player[player_stat] if player[:player_name] == player_name
  end 
end

def num_points_scored(player_name)
  get_player_stat(player_name, :points)
end 

def shoe_size(player_name)
  get_player_stat(player_name, :shoe)
end 

def team_colors(team_name)
  if game_hash[:home][:team_name].include?(team_name)
    return game_hash[:home][:colors]
  else 
    game_hash[:away][:colors]
  end
end 

def team_names
  teams = []
  teams << game_hash[:home][:team_name]
  teams << game_hash[:away][:team_name]
end

def player_numbers(team_name)
  player_numbers = []
  if game_hash[:home][:team_name].include?(team_name)
    game_hash[:home][:players].map do |player|
      player_numbers << player[:number]
    end
  else
    game_hash[:away][:players].map do |player|
      player_numbers << player[:number]
    end
  end
  player_numbers
end

def player_stats(player_name)
  players = get_all_players
  player = players.find do |player|
    player[:player_name] == player_name
  end
  player.delete(:player_name)
  player
  
end

def big_shoe_rebounds
  players = get_all_players
  player_with_biggest_shoe = players.reduce(nil) do |memo, player|
    memo = player unless memo
    # compare shoe size, store biggest size player
    memo = player if memo[:shoe] < player[:shoe]
    memo
  end 
  player_with_biggest_shoe[:rebounds]
end

def most_points_scored
  players = get_all_players
  player_with_highest_score = players.reduce(nil) do |memo, player|
    memo = player unless memo
    memo = player if memo[:points] < player[:points]
    memo
  end 
  player_with_highest_score[:player_name]
end 

def winning_team
  # get each teams total points 
  home_points = game_hash[:home][:players].reduce(0) do |memo, player|
    memo += player[:points]
  end
  away_points = game_hash[:away][:players].reduce(0) do |memo, player|
    memo += player[:points]
  end 
  return game_hash[:home][:team_name] unless away_points > home_points
  game_hash[:away][:team_name]
  
end 

def player_with_longest_name 
  players = get_all_players
  player_with_longest_name = players.reduce(nil) do |memo, player|
    memo = player unless memo
    memo = player if memo[:player_name].length < player[:player_name].length
    memo
  end 
  player_with_longest_name[:player_name]
end 

def long_name_steals_a_ton?
  players = get_all_players
  player_with_most_steals = players.reduce(nil) do |memo, player|
    memo = player unless memo
    memo = player if memo[:steals] < player[:steals]
    memo
  end 
  longest_name = player_with_longest_name
  return true if player_with_most_steals[:player_name] == longest_name
  false
end










