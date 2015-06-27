class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name
      t.string :status
      t.integer :disk_usage
      t.references :machine_template

      t.timestamps null: false
    end

    add_foreign_key :machines, :machine_templates
  end
end
