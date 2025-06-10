class AddImageUrlToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :image_url, :string
  end
end
