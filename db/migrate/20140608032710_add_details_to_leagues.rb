class AddDetailsToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :RB_starters, :integer
    add_column :leagues, :WR_starters, :integer
    add_column :leagues, :QB_starters, :integer
    add_column :leagues, :TE_starters, :integer
    add_column :leagues, :RB_bench, :float
    add_column :leagues, :WR_bench, :float
    add_column :leagues, :QB_bench, :float
    add_column :leagues, :TE_bench, :float
    add_column :leagues, :RB_count, :float
    add_column :leagues, :WR_count, :float
    add_column :leagues, :QB_count, :float
    add_column :leagues, :TE_count, :float
    add_column :leagues, :K_count, :float
    add_column :leagues, :DEF_count, :float
    add_column :leagues, :Total_count, :float
    add_column :leagues, :Team_starter, :float
    add_column :leagues, :Total_budget, :float
    add_column :leagues, :StartVBD, :float
    add_column :leagues, :BenchVBD, :float
    add_column :leagues, :Bench_percent, :float
    add_column :leagues, :VBD_total, :float
    add_column :leagues, :Bench_total, :float
    add_column :leagues, :Start_total, :float
  end
end
