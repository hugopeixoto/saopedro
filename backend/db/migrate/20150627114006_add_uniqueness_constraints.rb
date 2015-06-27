class AddUniquenessConstraints < ActiveRecord::Migration
  def change
    add_index :providers, :name, unique: true
    add_index :machine_templates, [:name, :provider_id], unique: true
    add_index :machines, :name, unique: true
    add_index :runscripts, :name, unique: true
  end
end
