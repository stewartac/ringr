class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
  end


end
