class AddAttrToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :postalcode, :integer
    add_column :contacts, :name_of_street, :string
    add_column :contacts, :name_of_town, :string
    add_column :contacts, :email, :string
    add_column :contacts, :webaddress, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :fax, :string
  end
end
