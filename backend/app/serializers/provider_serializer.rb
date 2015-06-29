class ProviderSerializer < BaseSerializer
  attributes :id, :name, :api_key

  has_many :machine_templates
end
