class Contact < ActiveRecord::Base
#Assoziationen Kontakt
belongs_to :user
has_many :contactpsns

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
validates :name, presence: true
validates :name, uniqueness: true


end
