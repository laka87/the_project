class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :contactpsn, dependent: :destroy
  belongs_to :contact, dependent: :destroy



  #Sunspot Searchable Block Kontakte

#    searchable do
#      text :name
#      text :date
#      text :category
#      text :contactpsn do
#        contactpsn.full_name if contactpsn
#      end
#
#      text :contact do
#        contactpsn.contact.name if name
#      end
#
#    end

def remaining_time
  t = date.to_time - Time.now
  "%2d Tage %2d h %2d Min." % [t/86400, t/3600%24 , t/60%60]

end

end
