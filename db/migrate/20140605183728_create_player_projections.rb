class CreatePlayerProjections < ActiveRecord::Migration
  def change
    create_table :player_projections do |t|
      t.string :player
      t.string :team
      t.string :position
      t.integer :completions
      t.integer :pass_yds
      t.integer :pass_td
      t.integer :interceptions
      t.integer :rush_yds
      t.integer :rush_td
      t.integer :receptions
      t.integer :rec_yds
      t.integer :rec_td
      t.integer :fumbles

      t.timestamps

    end
  end
end
