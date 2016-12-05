class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.text :description

      t.timestamps null: false
    end
  end
end
