class Contact < ActiveRecord::Base
#Assoziationen Kontakt
belongs_to :user
has_many :contactpsns
has_many :meetings

#Sunspot Searchable Block Kontakte
#  searchable do
#    text :name
#    text :postalcode
#    text :name_of_town
#    text :first_name do
#      contactpsns.map(&:first_name)
#    end
#  end

#Validierungen
validates :contact_name, presence: true
validates :contact_name, uniqueness: true

def name=(s)
  super s.capitalize
  end
end
