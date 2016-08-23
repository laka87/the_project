class UsersController < ApplicationController
  before_action :is_admin? , only: [:index, :show, :edit]
  before_action :authenticate_user!,  only: [:index, :show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

private

def is_admin?
   if !current_user.admin?
     flash[:danger] = "Sie sind nicht autorisiert diese Aktion durchzuführen."
     redirect_to welcome_path
  end
end



end
