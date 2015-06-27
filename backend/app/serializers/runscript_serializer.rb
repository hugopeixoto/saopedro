class RunscriptSerializer < ActiveModel::Serializer
  attributes :id, :name, :script, :tag_list
end
