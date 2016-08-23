class AddCategoryToContactpsns < ActiveRecord::Migration
  def change
    add_column :contactpsns, :category, :string
  end
end
