class CreateGenrefications < ActiveRecord::Migration
  def change
    create_table :genrefications do |t|
      t.references :movie, index: true
      t.references :genre, index: true

      t.timestamps
    end
  end
end
