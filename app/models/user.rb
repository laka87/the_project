class User < ActiveRecord::Base

  has_many :contacts
  has_many :contactpsns
  has_many :meetings

#Sunspot Searchable Block Users
#  searchable do
#    text :first_name
#    text :surname
#    text :email
#  end



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    "#{first_name} #{surname}"
  end





end
