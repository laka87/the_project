class Contactpsn < ActiveRecord::Base

#Assoziationen für Model Kontaktperson
  belongs_to :contact
  belongs_to :user
  has_many :meetings

#Sunspot Searchable Block Kontaktpersonen
#  searchable do
#    text :first_name
#    text :last_name
#    text :department
#    text :email
#    text :business_rel
#  end

#Zusammenfügen zu einem Helper Voller Name
  def full_name
    if :first_name.blank?
    "#{last_name}"
      elsif :last_name.blank?
        "#{first_name}"
      else
          "#{first_name} #{last_name}"
      end
end

def full_name=(s)
  super s.titeleize
  end


#Funktion für Farbanzeige
  def colorswitch
    #//todo
  end
#Validierungen
validates :last_name, presence: true
validates :email, presence: true


end
