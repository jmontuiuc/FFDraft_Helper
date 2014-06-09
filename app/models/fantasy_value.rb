class FantasyValue < ActiveRecord::Base
  has_many :leagues
  belongs_to :team
end
