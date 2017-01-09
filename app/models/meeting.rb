class Meeting < ActiveRecord::Base
  belongs_to :user
  belongs_to :contactpsn
  belongs_to :contact



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

def contact_title
    contact.try(:contact_name)
  end


def contact_title=(contact_name)
      self.contact = Contact.where(:contact_name => contact_name).first if contact_name.present?
  end

  #Validierungen
  validates :meeting_name, presence: true
  validates :date, presence: true
  validates :contact_id, presence: true

end
