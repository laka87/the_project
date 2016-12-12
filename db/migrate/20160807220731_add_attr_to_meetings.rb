class AddAttrToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :date, :date
    add_column :meetings, :importance, :string
    add_column :meetings, :time_of_meeting, :string
  end
end
