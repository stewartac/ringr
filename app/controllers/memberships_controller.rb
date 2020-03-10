class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end

  def create
    @membership = Membership.find(params[:team_id])
    @membership.user = current_user
    @membership.team = @team
    if membership.save

  end

end
