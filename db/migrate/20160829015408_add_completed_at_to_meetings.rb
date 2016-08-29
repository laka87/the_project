class AddCompletedAtToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :completed_at, :datetime
  end
end
