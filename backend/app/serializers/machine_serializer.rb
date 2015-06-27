class MachineSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :disk_usage, :tag_list
end
