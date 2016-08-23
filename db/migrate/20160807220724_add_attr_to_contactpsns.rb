class AddAttrToContactpsns < ActiveRecord::Migration
  def change
    add_column :contactpsns, :position, :string
    add_column :contactpsns, :call, :string
    add_column :contactpsns, :last_name, :string
    add_column :contactpsns, :email, :string
    add_column :contactpsns, :department, :string
    add_column :contactpsns, :phone_one, :string
    add_column :contactpsns, :phone_two, :string
    add_column :contactpsns, :fax, :string
    add_column :contactpsns, :business_rel, :string

    add_column :contactpsns, :alt_postalcode, :string
    add_column :contactpsns, :alt_street, :string
    add_column :contactpsns, :alt_town, :string
    add_column :contactpsns, :alt_adv_street, :string
  end
end
