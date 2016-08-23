class AddContactpsnIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :contactpsn_id, :integer
  end
end
