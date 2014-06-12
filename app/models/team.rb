class Team < ActiveRecord::Base
  has_many :leagues
  has_many :fantasy_values
end
