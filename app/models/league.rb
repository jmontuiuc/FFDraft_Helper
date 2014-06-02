class League < ActiveRecord::Base
  belongs_to :user

  validates :league_name, :presence => true
  validates :QB_start, :presence => true, numericality: { only_integer: true }
  validates :RB_start, :presence => true, numericality: { only_integer: true }
  validates :WR_start, :presence => true, numericality: { only_integer: true }
  validates :TE_start, :presence => true, numericality: { only_integer: true }
  validates :Flex_start, :presence => true, numericality: { only_integer: true }
  validates :K_start, :presence => true, numericality: { only_integer: true }
  validates :Def_start, :presence => true, numericality: { only_integer: true }
  validates :Start_percent, :presence => true, numericality: true
  validates :Teams, :presence => true, numericality: { only_integer: true }
  validates :Budget, :presence => true, numericality: { only_integer: true }
  validates :Bench, :presence => true, numericality: { only_integer: true }
  validates :PaTd, :presence => true, numericality: true
  validates :PaYd, :presence => true, numericality: true
  validates :PaInt, :presence => true, numericality: true
  validates :RuTd, :presence => true, numericality: true
  validates :RuYd, :presence => true, numericality: true
  validates :Rec, :presence => true, numericality: true
  validates :RecTd, :presence => true, numericality: true
  validates :ReYd, :presence => true, numericality: true
  validates :Fum, :presence => true, numericality: true
  validates :Comp, :presence => true, numericality: true
end
