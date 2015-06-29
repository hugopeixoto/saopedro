class MachineTemplateSerializerTest < ActiveSupport::TestCase
  def serialize machine_template
    serializer = MachineTemplateSerializer.new(machine_template)
    ActiveModel::Serializer::Adapter::JsonApi.new(serializer).as_json
  end

  test "serialization" do
    provider = Provider.create(name: 'a name')
    machine_template = MachineTemplate.create name: "", disk: "500M",
      cores: "2", ram: 500, price: "barato", location: "Portugal",
      transfer: "1TB", provider_id: provider.id

    expected = {
      data: {
        id: machine_template.id.to_s,
        type: 'machine_templates',
        attributes: {
          name: machine_template.name,
          disk: machine_template.disk,
          cores: machine_template.cores,
          ram: machine_template.ram,
          price: machine_template.price,
          location: machine_template.location,
          transfer: machine_template.transfer,
        },
        relationships: {
          provider: {
            data:
            { type: "providers", id: provider.id.to_s }
          }
        }
      }
    }

    assert_equal expected, serialize(machine_template)
  end
end
