class AddMoreParamsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :type_of_contact, :string
    add_column :contacts, :adv_street, :string
  end
end
