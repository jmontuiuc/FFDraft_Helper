class FantasyValue < ActiveRecord::Base
  belongs_to :league
  belongs_to :team
  belongs_to :player_projection
end
