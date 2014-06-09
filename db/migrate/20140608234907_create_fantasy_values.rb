class CreateFantasyValues < ActiveRecord::Migration
  def change
    create_table :fantasy_values do |t|
      t.integer :league_id
      t.string :player
      t.float :fpts
      t.float :start_vbd
      t.float :bench_vbd
      t.float :auction_value
      t.float :paid
      t.float :inflated_value
    end
  end
end
