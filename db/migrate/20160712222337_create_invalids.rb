class CreateInvalids < ActiveRecord::Migration
  def change
    create_table :invalids do |t|

      t.timestamps null: false
    end
  end
end
