json.extract! player, :id, :name, :team_id, :points_per_game, :assists_per_game, :rebounds_per_game, :created_at, :updated_at
json.url player_url(player, format: :json)
