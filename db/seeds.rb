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
  te.save
end
puts "There are now #{TE_projections.count} TEs in the projections table."

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
