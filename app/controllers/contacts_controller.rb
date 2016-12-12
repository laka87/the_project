class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :is_admin?, only: [:delete]


def home
  @contacts = Contact.all

  unless user_signed_in?
    redirect_to new_user_session_path
  end

  @meetings = Meeting.all
  @meetings_by_date = @meetings.group_by(&:date)
  @date = params[:date] ? Date.parse(params[:date]) : Date.today


end

def index
  @search = Contact.search(params[:q])
  @contacts = @search.result.page(params[:page]).per_page(5)
end

def show

end

def new
  @contact = current_user.contacts.build
end

def create
  @contact = current_user.contacts.build(contact_params)
  @contact.category = "Kontakt"
  if @contact.save
    redirect_to "/contacts"
    else render "new"
  end
end

def edit
end

def update
  if @contact.update(contact_params)
    redirect_to "/contacts", notice: "Erfolgreich editiert!"
  else render "edit"
  end
end

def destroy
  if @contact.destroy
    redirect_to "/contacts"
  end
end

def history
  @contacts = Contact.all
end

def autocomplete
  @contacts = Contact.order(:contact_name).where("contact_name like ?", "%#{params[:term]}%")
  render json: @contacts.map(&:contact_name)
end


private

def set_contact
  @contact = Contact.find(params[:id])
end

def contact_params
  params.require(:contact).permit(:contact_name,:email, :description, :postalcode, :name_of_street, :name_of_town , :fax, :phone, :type_of_contact, :alt_adv_street, :alt_town, :alt_street, :alt_postalcode, :category)
end

def is_admin?
   if !current_user.admin?
     flash[:danger] = "Sie sind nicht autorisiert diese Aktion durchzuführen."
     redirect_to home_url
  end
end

end
