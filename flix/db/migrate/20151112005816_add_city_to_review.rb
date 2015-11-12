class AddCityToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :city, :string
  end
end
