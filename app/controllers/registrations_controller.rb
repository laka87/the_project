class RegistrationsController < Devise::RegistrationsController

protected



#def after_sign_up_path_for(resource)
#  home_path
#end

def new
  super
end

def create
  super
end

private

def sign_up_params
  params.require(:user).permit(:first_name, :surname,:email, :password, :password_confirmation)
end

def account_update_params
  params.require(:user).permit(:first_name, :surname, :email, :password, :password_confirmation, :current_password)
end


end
