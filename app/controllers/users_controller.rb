class UsersController < ApplicationController
  before_action :is_admin? , only: [:index, :show, :edit]
  before_action :authenticate_user!,  only: [:index, :show, :edit]



  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(account_update_params)
      redirect_to home_path, notice: 'Nutzer erfolgreich editiert'
    else
      render :edit
    end
  end

  def destroy
    if destroy_user_session
      redirect_to new_user_session_path
    end
  end


  private

  def sign_up_params
    params.require(:user).permit(:first_name, :surname,:email, :password, :password_confirmation, :admin)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :surname, :email, :admin)
  end

  def account_update_pw
    params.require(:user).permit(:password, :password_confirmation)
  end



private

def is_admin?
   if !current_user.admin?
     flash[:danger] = "Sie sind nicht autorisiert diese Aktion durchzuführen."
     redirect_to welcome_path
  end
end


end
