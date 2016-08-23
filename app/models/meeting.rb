class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :contactpsn


  #Sunspot Searchable Block Kontakte
    searchable do
      text :name
      text :date
    

    end



end
