class LeaguesController < ApplicationController
  def index
    @leagues = current_user.leagues.all
  end

  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new
    @league.league_name = params[:league_name]
    @league.QB_start = params[:QB_start]
    @league.RB_start = params[:RB_start]
    @league.WR_start = params[:WR_start]
    @league.TE_start = params[:TE_start]
    @league.Flex_start = params[:Flex_start]
    @league.K_start = params[:K_start]
    @league.Def_start = params[:Def_start]
    @league.Start_percent = params[:Start_percent]
    @league.Teams = params[:Teams]
    @league.Budget = params[:Budget]
    @league.Bench = params[:Bench]
    @league.PaTd = params[:PaTd]
    @league.PaYd = params[:PaYd]
    @league.PaInt = params[:PaInt]
    @league.RuTd = params[:RuTd]
    @league.RuYd = params[:RuYd]
    @league.Rec = params[:Rec]
    @league.RecTd = params[:RecTd]
    @league.ReYd = params[:ReYd]
    @league.Fum = params[:Fum]
    @league.Comp = params[:Comp]
    @league.user_id = current_user.id

    if @league.save
      redirect_to "/leagues", :notice => "League created successfully."
    else
      render 'new'
    end
  end

  def edit
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])

    @league.league_name = params[:league_name]
    @league.QB_start = params[:QB_start]
    @league.RB_start = params[:RB_start]
    @league.WR_start = params[:WR_start]
    @league.TE_start = params[:TE_start]
    @league.Flex_start = params[:Flex_start]
    @league.K_start = params[:K_start]
    @league.Def_start = params[:Def_start]
    @league.Start_percent = params[:Start_percent]
    @league.Teams = params[:Teams]
    @league.Budget = params[:Budget]
    @league.Bench = params[:Bench]
    @league.PaTd = params[:PaTd]
    @league.PaYd = params[:PaYd]
    @league.PaInt = params[:PaInt]
    @league.RuTd = params[:RuTd]
    @league.RuYd = params[:RuYd]
    @league.Rec = params[:Rec]
    @league.RecTd = params[:RecTd]
    @league.ReYd = params[:ReYd]
    @league.Fum = params[:Fum]
    @league.Comp = params[:Comp]
    @league.user_id = current_user.id
    @league.RB_starters = (@league.RB_start + @league.Flex_start)* @league.Teams
    @league.WR_starters = @league.WR_start * @league.Teams
    @league.QB_starters = @league.QB_start * @league.Teams
    @league.TE_starters = @league.TE_start * @league.Teams
    @league.Start_total = @league.RB_starters + @league.WR_starters + @league.QB_starters + @league.TE_starters
    @league.RB_bench = (@league.RB_starters/@league.Start_total) * (@league.Teams * @league.Bench)
    @league.WR_bench = (@league.WR_starters/@league.Start_total) * (@league.Teams * @league.Bench)
    @league.QB_bench = (@league.QB_starters/@league.Start_total) * (@league.Teams * @league.Bench)
    @league.TE_bench = (@league.TE_starters/@league.Start_total) * (@league.Teams * @league.Bench)
    @league.Bench_total = @league.RB_bench + @league.WR_bench + @league.QB_bench + @league.TE_bench
    @league.RB_count = @league.RB_starters + @league.RB_bench
    @league.WR_count = @league.WR_starters + @league.WR_bench
    @league.QB_count = @league.QB_starters + @league.QB_bench
    @league.TE_count = @league.TE_starters + @league.TE_bench
    @league.K_count = @league.K_start * @league.Teams
    @league.DEF_count = @league.Def_start * @league.Teams
    @league.Total_count = @league.RB_count + @league.WR_count + @league.QB_count + @league.TE_count + @league.K_count + @league.DEF_count
    @league.Team_starter = @league.QB_start + @league.RB_start + @league.WR_start + @league.TE_start + @league.Flex_start + @league.K_start + @league.Def_start
    @league.Total_budget = (@league.Teams * @league.Budget) - (@league.K_start * @league.Teams) - (@league.Def_start * @league.Teams)
    # @StartVBD
    # @BenchVBD
    @Bench_percent = 1 - @Start_percent
    # @VBD_total

    if @league.save
      redirect_to "/leagues/#{params[:id]}", :notice => "League updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @league = League.find(params[:id])

    @league.destroy

    redirect_to "/leagues", :notice => "League deleted."
  end
end
