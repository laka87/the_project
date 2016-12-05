class AddContactIdToMeetings < ActiveRecord::Migration
  def change
        add_column :meetings, :contact_id, :integer
  end
end
