class PlayerProjectionsController < ApplicationController
  def index
    @player_projections = PlayerProjection.all
  end

  def show
    @player_projection = PlayerProjection.find(params[:id])
  end

  def new
    @player_projection = PlayerProjection.new
  end

  def create
    @player_projection = PlayerProjection.new
    @player_projection.player = params[:player]
    @player_projection.team = params[:team]
    @player_projection.position = params[:position]
    @player_projection.completions = params[:completions]
    @player_projection.pass_yds = params[:pass_yds]
    @player_projection.pass_td = params[:pass_td]
    @player_projection.interceptions = params[:interceptions]
    @player_projection.rush_yds = params[:rush_yds]
    @player_projection.rush_td = params[:rush_td]
    @player_projection.receptions = params[:receptions]
    @player_projection.rec_yds = params[:rec_yds]
    @player_projection.rec_td = params[:rec_td]
    @player_projection.fumbles = params[:fumbles]

    if @player_projection.save
      redirect_to "/player_projections", :notice => "Player projection created successfully."
    else
      render 'new'
    end
  end

  def edit
    @player_projection = PlayerProjection.find(params[:id])
  end

  def update
    @player_projection = PlayerProjection.find(params[:id])

    @player_projection.player = params[:player]
    @player_projection.team = params[:team]
    @player_projection.position = params[:position]
    @player_projection.completions = params[:completions]
    @player_projection.pass_yds = params[:pass_yds]
    @player_projection.pass_td = params[:pass_td]
    @player_projection.interceptions = params[:interceptions]
    @player_projection.rush_yds = params[:rush_yds]
    @player_projection.rush_td = params[:rush_td]
    @player_projection.receptions = params[:receptions]
    @player_projection.rec_yds = params[:rec_yds]
    @player_projection.rec_td = params[:rec_td]
    @player_projection.fumbles = params[:fumbles]

    if @player_projection.save
      redirect_to "/player_projections", :notice => "Player projection updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @player_projection = PlayerProjection.find(params[:id])

    @player_projection.destroy

    redirect_to "/player_projections", :notice => "Player projection deleted."
  end
end
