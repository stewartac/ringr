class TeamsController < ApplicationController

  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def show
    @membership = Membership.new
    if params[:newmember] == "1"
      @membership = Membership.new
      @membership.team = @team
      @membership.user = current_user
      if @membership.save
        redirect_to team_path(@team)
      end
    else
      @membership = Membership.new
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    @team.user = current_user
    if @team.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @team.update(title: params[:team][:title], league_link: params[:team][:league_link])
    redirect_to user_team_path(@team)
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
    params.require(:team).permit(:name, :league_link, :bio, :sport)
  end

end
