class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :blub
      t.text :desc

      t.timestamps null: false
    end
  end
end
