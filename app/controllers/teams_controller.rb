class TeamsController < ApplicationController

  before_action :set_team, :only [:show, :edit, :destroy]

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user = current_user
    if @team.save
      redirect_to user_team_path(@team)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update
  end

  def destroy
    @team.destroy
    redirect_to user_path(@team)
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :league_link)
  end

end
