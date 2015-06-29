class MachineTemplateSerializer < BaseSerializer
  attributes :id, :name, :disk, :cores, :ram, :price, :location, :transfer

  belongs_to :provider
end
