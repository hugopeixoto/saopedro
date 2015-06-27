class CreateMachineTemplates < ActiveRecord::Migration
  def change
    create_table :machine_templates do |t|
      t.string :name
      t.integer :disk
      t.integer :cores
      t.integer :ram
      t.string :price
      t.string :location
      t.string :transfer
      t.references :provider

      t.timestamps null: false
    end

    add_foreign_key :machine_templates, :providers
  end
end
