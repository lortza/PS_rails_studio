class MakePledgesAJoinTable < ActiveRecord::Migration
  def up
    Pledge.delete_all
    remove_column :pledges, :name
    remove_column :pledges, :email
    remove_column :pledges, :city
    add_column :pledges, :user_id, :integer
  end #up

  def down
    Pledge.delete_all
    remove_column :pledges, :user_id
    add_column :pledges, :name, :string
    add_column :pledges, :email, :string
    add_column :pledges, :city, :string
  end #down
    
end #MakePledgesAJoinTable
