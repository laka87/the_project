class ContactpsnsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, except: [:history]
  before_action :set_contactpsn, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:delete]
  helper_method :sort_column, :sort_direction

#Index Method mit Searchable results param über Sunpot
def index

  @search = Contactpsn.search do
    fulltext params[:search]
  end
  @contactpsns = @search.results
end

def show

end

def new
    @contactpsn = Contactpsn.new
end
#Create Method für Assoziation mit Kontakt und User
def create
  @contactpsn = Contactpsn.create(contactpsn_params)
  @contactpsn.user_id = current_user.id
  @contactpsn.contact_id = @contact.id
  @contactpsn.category = "Kontaktperson"
  if @contactpsn.save
    redirect_to contact_contactpsns_path
  else render "new"
  end
end

def edit
end

def update
  if @contactpsn.update(contactpsn_params)
    redirect_to contact_contactpsns_path, notice: "Erfolgreich editiert!"
  else render "edit"
  end
end

def destroy
  if @contactpsn.destroy
  redirect_to contact_contactpsns_path
 end
end

def history
  @contactpsns = Contactpsn.all
end

private

def set_contact
@contact = Contact.find(params[:contact_id])
end

def set_contactpsn
@contactpsn = Contactpsn.find(params[:id])
end

def contactpsn_params
params.require(:contactpsn).permit(:first_name,:last_name,:email, :description, :business_rel, :position, :call , :fax, :phone_one, :phone_two, :department, :alt_adv_street, :alt_town, :alt_street, :alt_postalcode, :category)
end

def sort_column
  Contactpsn.column_names.include?(params[:sort]) ? params[:sort] : "name"
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
end

def is_admin?
   if !current_user.admin?
     flash[:danger] = "Sie sind nicht autorisiert diese Aktion durchzuführen."
     redirect_to root_url
  end
end

end
