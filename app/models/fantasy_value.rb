class FantasyValue < ActiveRecord::Base
  has_many :leagues
  belongs_to :team
  belongs_to :player_projection
end
