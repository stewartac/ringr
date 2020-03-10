class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create
    @team = Team.find(params[:team_id])
    @membership = Membership.new
    @membership.team = @team
    @membership.user = current_user
    if @membership.save
      redirect_to team_path(@team)
    else
      redirect_to team_path(@team), flash: {danger: "You can't join a team more than once"}
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    redirect_to user_path(current_user)
  end

end
