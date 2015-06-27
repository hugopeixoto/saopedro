class CreateRunscripts < ActiveRecord::Migration
  def change
    create_table :runscripts do |t|
      t.string :name
      t.text :script

      t.timestamps null: false
    end
  end
end
