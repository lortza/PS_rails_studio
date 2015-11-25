class AddCityToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :city, :string
  end
end
