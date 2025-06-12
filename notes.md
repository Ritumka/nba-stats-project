# Loading CSV Data

- Create  folder `csvs` inside the `lib` folder.
- Put csv file there
- Run `rails generate task slurp players_teams` to create `slurp.rb`
- Insert in `slurp.rb`:
```ruby
namespace :slurp do
  desc "Create sample data for Teams and Players tables"
  task players_teams: :environment do

  end
end
```
- The following code to read CSV:
```ruby
require "csv" 

csv_text = File.read(Rails.root.join("lib", "csvs", "teams.csv"))
```
- Insert in `slurp.rb` the following code to parse CSV:
```ruby
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
``` 
- Looping through the parsed data:
```ruby
csv.each do |row|
  puts row.to_hash
end
```
- Create a database object from each row:
```ruby
t = Team.new
t.id = row["id"]
t.name = row["name"]
t.image_url = row["image_url"]
t.save
```

- And outside of the loop:
```ruby
puts "#{Team.count} created."
```

- Same for players
- Run `rails --tasks` to see the tasks names
- Add this to the top to destroy previous data:
```ruby
if Rails.env.development?
    puts "Destroying previous data..."

    Team.destroy_all
    Player.destroy_all
  end
```

- To look by team_name: 

```ruby
   team_id = team_ids_by_name[row["team_name"]]
    unless team_id
      puts "⚠️ Team not found for player #{row["name"]} - team_name: #{row["team_name"]}"
      next
    end
```

and add: `p.team_id = team_id` and update CSV
