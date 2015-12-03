class MakeReviewsAJoinTable < ActiveRecord::Migration
  def up
    remove_column :reviews, :name
    add_column    :reviews, :user_id, :integer
  end #up

  def down
    remove_column :reviews, :user_id
    add_column    :reviews, :name,  :string
  end #down
end #MakeReviewsAJoinTable
