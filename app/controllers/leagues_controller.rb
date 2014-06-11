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
    @Bench_percent = 1 - @league.Start_percent

    PlayerProjection.all.each do |value|
      @value = FantasyValue.new
      @value.league_id = @league.id
      @value.player = value.player
      @value.fpts = (value.pass_yds * @league.PaYd) + (value.pass_td * @league.PaTd) + (value.interceptions * @league.PaInt) + (value.rush_yds * @league.RuYd) +(value.rush_td * @league.RuTd) + (value.fumbles * @league.Fum) + (value.completions * @league.Comp) + (value.receptions * @league.Rec) + (value.rec_yds * @league.ReYd) + (value.rec_td * @league.RecTd)
      @value.position = value.position
      @value.save
    end

    qb_fpts = FantasyValue.where(league_id: params[:id], position: 'QB').order('fpts DESC')
    rb_fpts = FantasyValue.where(league_id: params[:id], position: 'RB').order('fpts DESC')
    wr_fpts = FantasyValue.where(league_id: params[:id], position: 'WR').order('fpts DESC')
    te_fpts = FantasyValue.where(league_id: params[:id], position: 'TE').order('fpts DESC')

    top_qb = qb_fpts.take(@league.QB_starters)
    top_rb = rb_fpts.take(@league.RB_starters)
    top_wr = wr_fpts.take(@league.WR_starters)
    top_te = te_fpts.take(@league.TE_starters)

    last_qbstarter = top_qb.last
    last_rbstarter = top_rb.last
    last_wrstarter = top_wr.last
    last_testarter = top_te.last

    top_qb.each do |vbd|
       qb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       qb.start_vbd = qb.fpts - last_qbstarter.fpts
       qb.save
    end

    top_rb.each do |vbd|
       rb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       rb.start_vbd = rb.fpts - last_rbstarter.fpts
       rb.save
    end

    top_wr.each do |vbd|
       wr = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       wr.start_vbd = wr.fpts - last_wrstarter.fpts
       wr.save
    end

    top_te.each do |vbd|
       te = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       te.start_vbd = te.fpts - last_testarter.fpts
       te.save
    end

    bench_qb = qb_fpts.take(@league.QB_count)
    bench_rb = rb_fpts.take(@league.RB_count)
    bench_wr = wr_fpts.take(@league.WR_count)
    bench_te = te_fpts.take(@league.TE_count)

    last_qbbench = bench_qb.last
    last_rbbench = bench_rb.last
    last_wrbench = bench_wr.last
    last_tebench = bench_te.last

    bench_qb.each do |vbd|
       qb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       qb.bench_vbd = qb.fpts - last_qbbench.fpts
       qb.save
    end

    bench_rb.each do |vbd|
       rb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       rb.bench_vbd = rb.fpts - last_rbbench.fpts
       rb.save
    end

    bench_wr.each do |vbd|
       wr = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       wr.bench_vbd = wr.fpts - last_wrbench.fpts
       wr.save
    end

    bench_te.each do |vbd|
       te = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       te.bench_vbd = te.fpts - last_tebench.fpts
       te.save
    end

    @league.BenchVBD = FantasyValue.where(league_id: params[:id]).sum('bench_vbd')
    discretionary = @league.Total_budget - @league.Start_total - @league.Bench_total
    dols_per_point = discretionary/@league.BenchVBD

    FantasyValue.where(league_id: params[:id]).all.each do |dols|
      dols.auction_value = dols_per_point * dols.fpts
      dols.save
    end

    if @league.save
      redirect_to "/leagues/#{params[:id]}", :notice => "League created successfully."
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
    @Bench_percent = 1 - @league.Start_percent

   FantasyValue.where(league_id: params[:id]).all.each do |value|
      @project = PlayerProjection.find_by(player: value.player)
      value.fpts = (@project.pass_yds * @league.PaYd) + (@project.pass_td * @league.PaTd) + (@project.interceptions * @league.PaInt) + (@project.rush_yds * @league.RuYd) +(@project.rush_td * @league.RuTd) + (@project.fumbles * @league.Fum) + (@project.completions * @league.Comp) + (@project.receptions * @league.Rec) + (@project.rec_yds * @league.ReYd) + (@project.rec_td * @league.RecTd)
      if value.start_vbd.nil? then value.start_vbd = 0 end
      if value.bench_vbd.nil? then value.bench_vbd = 0 end
      value.save
    end

    qb_fpts = FantasyValue.where(league_id: params[:id], position: 'QB').order('fpts DESC')
    rb_fpts = FantasyValue.where(league_id: params[:id], position: 'RB').order('fpts DESC')
    wr_fpts = FantasyValue.where(league_id: params[:id], position: 'WR').order('fpts DESC')
    te_fpts = FantasyValue.where(league_id: params[:id], position: 'TE').order('fpts DESC')

    top_qb = qb_fpts.take(@league.QB_starters)
    top_rb = rb_fpts.take(@league.RB_starters)
    top_wr = wr_fpts.take(@league.WR_starters)
    top_te = te_fpts.take(@league.TE_starters)

    last_qbstarter = top_qb.last
    last_rbstarter = top_rb.last
    last_wrstarter = top_wr.last
    last_testarter = top_te.last

    top_qb.each do |vbd|
       qb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       qb.start_vbd = qb.fpts - last_qbstarter.fpts
       qb.save
    end

    top_rb.each do |vbd|
       rb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       rb.start_vbd = rb.fpts - last_rbstarter.fpts
       rb.save
    end

    top_wr.each do |vbd|
       wr = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       wr.start_vbd = wr.fpts - last_wrstarter.fpts
       wr.save
    end

    top_te.each do |vbd|
       te = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       te.start_vbd = te.fpts - last_testarter.fpts
       te.save
    end

    bench_qb = qb_fpts.take(@league.QB_count)
    bench_rb = rb_fpts.take(@league.RB_count)
    bench_wr = wr_fpts.take(@league.WR_count)
    bench_te = te_fpts.take(@league.TE_count)

    last_qbbench = bench_qb.last
    last_rbbench = bench_rb.last
    last_wrbench = bench_wr.last
    last_tebench = bench_te.last

    bench_qb.each do |vbd|
       qb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       qb.bench_vbd = qb.fpts - last_qbbench.fpts
       qb.save
    end

    bench_rb.each do |vbd|
       rb = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       rb.bench_vbd = rb.fpts - last_rbbench.fpts
       rb.save
    end

    bench_wr.each do |vbd|
       wr = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       wr.bench_vbd = wr.fpts - last_wrbench.fpts
       wr.save
    end

    bench_te.each do |vbd|
       te = FantasyValue.find_by(league_id: params[:id], player: vbd.player)
       te.bench_vbd = te.fpts - last_tebench.fpts
       te.save
    end


    @league.BenchVBD = FantasyValue.where(league_id: params[:id]).sum('bench_vbd')
    discretionary = @league.Total_budget - @league.Start_total - @league.Bench_total
    dols_per_point = discretionary/@league.BenchVBD

    FantasyValue.where(league_id: params[:id]).all.each do |dols|
      dols.auction_value = dols_per_point * dols.fpts
      dols.save
    end

    if @league.save
      redirect_to "/leagues/#{params[:id]}", :notice => "League updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @value = FantasyValue.where(league_id: params[:id])
    @value.destroy_all
    @league = League.find(params[:id])
    @league.destroy

    redirect_to "/leagues", :notice => "League deleted."
  end
end
