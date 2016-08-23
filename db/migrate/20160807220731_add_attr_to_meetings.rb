class AddAttrToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :date, :date
    add_column :meetings, :category, :string
    add_column :meetings, :daytime, :date
  end
end
