class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @upcoming = @user.bookings.where(status: 'accepted')
    @pending = @user.bookings.where(status: 'requested')
    @unsuccesful = @user.bookings.where(status: 'rejected')
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end
end
