namespace :slurp do
  desc "TODO"
  task players_teams: :environment do
    require "csv"

    if Rails.env.development?
      pp "Destroying Previous Data"
      Player.destroy_all
      Team.destroy_all
    end

    pp "Generate Teams"

    csv_text = File.read(Rails.root.join("lib", "csvs", "teams.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Team.new
      t.id = row["id"]
      t.name = row["name"]
      t.save
    end

    puts "There are now #{Team.count} teams."

    pp "Generating Players"

    csv_text = File.read(Rails.root.join("lib", "csvs", "players.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      p = Player.new
      p.team_id = row["team_id"]
      p.name = row["name"]
      p.points_per_game = row["points_per_game"]
      p.rebounds_per_game = row["rebounds_per_game"]
      p.assists_per_game = row["assist_per_game"]
      p.save
    end

    puts "There are now #{Player.count} players."
  end
end
