class AddAltAdressParamsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :alt_postalcode, :string
    add_column :contacts, :alt_street, :string
    add_column :contacts, :alt_town, :string
    add_column :contacts, :alt_adv_street, :string
  end
end
