# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Examples:

#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'
require 'json'

QB_url = "http://www.fantasyfootballnerd.com/service/draft-projections/json/7zj927bzqp9k/QB/"
QB_raw_data = open(QB_url).read
QB_parsed_data = JSON.parse(QB_raw_data)
QB_projections = QB_parsed_data["DraftProjections"]

PlayerProjection.destroy_all
QB_projections.each do |qb_stat|
  q = PlayerProjection.new

  q.player = qb_stat["displayName"]
  q.team = qb_stat["team"]
  q.position = "QB"
  q.completions = qb_stat["completions"]
  q.pass_yds = qb_stat["passingYards"]
  q.pass_td = qb_stat["passingTD"]
  q.interceptions = qb_stat["passingInt"]
  q.rush_yds = qb_stat["rushYards"]
  q.rush_td = qb_stat["rushTD"]

  if q.completions.nil? then q.completions = 0 end
  if q.pass_yds.nil? then q.pass_yds = 0 end
  if q.pass_td.nil? then q.pass_td = 0 end
  if q.interceptions.nil? then q.interceptions = 0 end
  if q.rush_yds.nil? then q.rush_yds = 0 end
  if q.rush_td.nil? then q.rush_td = 0 end
  if q.receptions.nil? then q.receptions = 0 end
  if q.rec_yds.nil? then q.rec_yds = 0 end
  if q.rec_td.nil? then q.rec_td = 0 end
  if q.fumbles.nil? then q.fumbles = 0 end

  q.save
end
puts "There are now #{QB_projections.count} QBs in the projections table."

RB_url = "http://www.fantasyfootballnerd.com/service/draft-projections/json/7zj927bzqp9k/RB/"
RB_raw_data = open(RB_url).read
RB_parsed_data = JSON.parse(RB_raw_data)
RB_projections = RB_parsed_data["DraftProjections"]

RB_projections.each do |rb_stat|
  rb = PlayerProjection.new

  rb.player = rb_stat["displayName"]
  rb.team = rb_stat["team"]
  rb.position = "RB"
  rb.rush_yds = rb_stat["rushYards"]
  rb.rush_td = rb_stat["rushTD"]
  rb.receptions = rb_stat["rec"]
  rb.rec_yds = rb_stat["recYards"]
  rb.rec_td = rb_stat["recTD"]
  rb.fumbles = rb_stat["fumbles"]

  if rb.completions.nil? then rb.completions = 0 end
  if rb.pass_yds.nil? then rb.pass_yds = 0 end
  if rb.pass_td.nil? then rb.pass_td = 0 end
  if rb.interceptions.nil? then rb.interceptions = 0 end
  if rb.rush_yds.nil? then rb.rush_yds = 0 end
  if rb.rush_td.nil? then rb.rush_td = 0 end
  if rb.receptions.nil? then rb.receptions = 0 end
  if rb.rec_yds.nil? then rb.rec_yds = 0 end
  if rb.rec_td.nil? then rb.rec_td = 0 end
  if rb.fumbles.nil? then rb.fumbles = 0 end

  rb.save
end
puts "There are now #{RB_projections.count} RBs in the projections table."

WR_url = "http://www.fantasyfootballnerd.com/service/draft-projections/json/7zj927bzqp9k/WR/"
WR_raw_data = open(WR_url).read
WR_parsed_data = JSON.parse(WR_raw_data)
WR_projections = WR_parsed_data["DraftProjections"]

WR_projections.each do |wr_stat|
  wr = PlayerProjection.new

  wr.player = wr_stat["displayName"]
  wr.team = wr_stat["team"]
  wr.position = "WR"
  wr.rush_yds = wr_stat["rushYards"]
  wr.rush_td = wr_stat["rushTD"]
  wr.receptions = wr_stat["rec"]
  wr.rec_yds = wr_stat["recYards"]
  wr.rec_td = wr_stat["recTD"]
  wr.fumbles = wr_stat["fumbles"]

  if wr.completions.nil? then wr.completions = 0 end
  if wr.pass_yds.nil? then wr.pass_yds = 0 end
  if wr.pass_td.nil? then wr.pass_td = 0 end
  if wr.interceptions.nil? then wr.interceptions = 0 end
  if wr.rush_yds.nil? then wr.rush_yds = 0 end
  if wr.rush_td.nil? then wr.rush_td = 0 end
  if wr.receptions.nil? then wr.receptions = 0 end
  if wr.rec_yds.nil? then wr.rec_yds = 0 end
  if wr.rec_td.nil? then wr.rec_td = 0 end
  if wr.fumbles.nil? then wr.fumbles = 0 end

  wr.save
end
puts "There are now #{WR_projections.count} WRs in the projections table."

TE_url = "http://www.fantasyfootballnerd.com/service/draft-projections/json/7zj927bzqp9k/TE/"
TE_raw_data = open(TE_url).read
TE_parsed_data = JSON.parse(TE_raw_data)
TE_projections = TE_parsed_data["DraftProjections"]

TE_projections.each do |te_stat|
  te = PlayerProjection.new

  te.player = te_stat["displayName"]
  te.team = te_stat["team"]
  te.position = "TE"
  te.rush_yds = te_stat["rushYards"]
  te.rush_td = te_stat["rushTD"]
  te.receptions = te_stat["rec"]
  te.rec_yds = te_stat["recYards"]
  te.rec_td = te_stat["recTD"]
  te.fumbles = te_stat["fumbles"]

  if te.completions.nil? then te.completions = 0 end
  if te.pass_yds.nil? then te.pass_yds = 0 end
  if te.pass_td.nil? then te.pass_td = 0 end
  if te.interceptions.nil? then te.interceptions = 0 end
  if te.rush_yds.nil? then te.rush_yds = 0 end
  if te.rush_td.nil? then te.rush_td = 0 end
  if te.receptions.nil? then te.receptions = 0 end
  if te.rec_yds.nil? then te.rec_yds = 0 end
  if te.rec_td.nil? then te.rec_td = 0 end
  if te.fumbles.nil? then te.fumbles = 0 end

  te.save
end
puts "There are now #{TE_projections.count} TEs in the projections table."

BYE_url = "http://www.fantasyfootballnerd.com/service/byes/json/7zj927bzqp9k/"
BYE_raw_data = open(BYE_url).read
BYE_parsed_data = JSON.parse(BYE_raw_data)
BYE_4 = BYE_parsed_data["Bye Week 4"]
BYE_5 = BYE_parsed_data["Bye Week 5"]
BYE_6 = BYE_parsed_data["Bye Week 6"]
BYE_7 = BYE_parsed_data["Bye Week 7"]
BYE_8 = BYE_parsed_data["Bye Week 8"]
BYE_9 = BYE_parsed_data["Bye Week 9"]
BYE_10 = BYE_parsed_data["Bye Week 10"]
BYE_11 = BYE_parsed_data["Bye Week 11"]
BYE_12 = BYE_parsed_data["Bye Week 12"]

BYE_4.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_5.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_6.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_7.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_8.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_9.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_10.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_11.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end

BYE_12.each do |bye|
  by = Team.new
  by.team = bye["team"]
  by.bye_week = bye["byeWeek"]
  by.save
end
puts "Bye weeks updated."
      # t.string :player
      # t.string :team
      # t.string :position
      # t.integer :completions
      # t.integer :pass_yds
      # t.integer :pass_td
      # t.integer :interceptions
      # t.integer :rush_yds
      # t.integer :rush_td
      # t.integer :receptions
      # t.integer :rec_yds
      # t.integer :rec_td
      # t.integer :fumbles
