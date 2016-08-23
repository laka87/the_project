class Contactpsn < ActiveRecord::Base

#Assoziationen für Model Kontaktperson
  belongs_to :contact
  belongs_to :user
  has_many :meetings

#Sunspot Searchable Block Kontaktpersonen
  searchable do
    text :first_name
    text :last_name
    text :department
    text :email
    text :business_rel
  end

#Zusammenfügen zu einem Helper Voller Name
  def full_name
    "#{first_name} #{last_name}"
  end

#Validierungen
validates :first_name, presence: true
validates :last_name, presence: true
validates :description, presence: true
validates :email, presence: true

end
