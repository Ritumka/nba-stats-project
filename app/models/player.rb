# == Schema Information
#
# Table name: players
#
#  id                :bigint           not null, primary key
#  assists_per_game  :float
#  image_url         :string
#  name              :string
#  points_per_game   :float
#  rebounds_per_game :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  team_id           :integer
#
class Player < ApplicationRecord
  belongs_to :team, required: true, class_name: "Team", foreign_key: "team_id"
end
