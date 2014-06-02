class League < ActiveRecord::Base
  belongs_to :user

  validates :league_name, :presence => true
  validates :QB_start, :presence => true
  validates :RB_start, :presence => true
  validates :WR_start, :presence => true
  validates :TE_start, :presence => true
  validates :Flex_start, :presence => true
  validates :K_start, :presence => true
  validates :Def_start, :presence => true
  validates :Start_percent, :presence => true
  validates :Teams, :presence => true
  validates :Budget, :presence => true
  validates :Bench, :presence => true
  validates :PaTd, :presence => true
  validates :PaYd, :presence => true
  validates :PaInt, :presence => true
  validates :RuTd, :presence => true
  validates :RuYd, :presence => true
  validates :Rec, :presence => true
  validates :RecTd, :presence => true
  validates :ReYd, :presence => true
  validates :Fum, :presence => true
  validates :Comp, :presence => true
end
