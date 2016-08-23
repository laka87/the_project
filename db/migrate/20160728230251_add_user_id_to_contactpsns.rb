class AddUserIdToContactpsns < ActiveRecord::Migration
  def change
    add_column :contactpsns, :user_id, :integer
  end
end
