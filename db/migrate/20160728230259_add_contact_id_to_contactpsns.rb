class AddContactIdToContactpsns < ActiveRecord::Migration
  def change
    add_column :contactpsns, :contact_id, :integer
  end
end
