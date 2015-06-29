class ProviderSerializerTest < ActiveSupport::TestCase
  def serialize provider
    serializer = ProviderSerializer.new(provider)
    ActiveModel::Serializer::Adapter::JsonApi.new(serializer).as_json
  end

  test "serialization" do
    machine_template = MachineTemplate.create(name: 'template')
    provider = Provider.create name: "", api_key: "OK",
      machine_templates: [machine_template]

    expected = {
      data: {
        id: provider.id.to_s,
        type: 'providers',
        attributes: {
          name: provider.name,
          "api-key": provider.api_key
        },
        relationships: {
          machine_templates: {
            data: [
              { type: 'machine_templates', id: machine_template.id.to_s }
            ]
          }
        }
      }
    }

    assert_equal expected, serialize(provider)
  end
end
