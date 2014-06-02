class LeaguesController < ApplicationController
  def index
    @leagues = League.all
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

    if @league.save
      redirect_to "/leagues", :notice => "League updated successfully."
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
