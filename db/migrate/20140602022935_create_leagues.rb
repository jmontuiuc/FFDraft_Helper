class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :league_name
      t.integer :QB_start
      t.integer :RB_start
      t.integer :WR_start
      t.integer :TE_start
      t.integer :Flex_start
      t.integer :K_start
      t.integer :Def_start
      t.float :Start_percent
      t.integer :Teams
      t.integer :Budget
      t.integer :Bench
      t.float :PaTd
      t.float :PaYd
      t.float :PaInt
      t.float :RuTd
      t.float :RuYd
      t.float :Rec
      t.float :RecTd
      t.float :ReYd
      t.float :Fum
      t.float :Comp

      t.timestamps

    end
  end
end
