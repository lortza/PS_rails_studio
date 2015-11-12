class AddProjectToPledges < ActiveRecord::Migration
  def change
    add_column :pledges, :project, :resources
  end
end
