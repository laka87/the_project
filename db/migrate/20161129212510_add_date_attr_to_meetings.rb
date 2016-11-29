class AddDateAttrToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :date_hours, :date
    add_column :meetings, :date_minutes, :date
  end
end
