class MachineSerializerTest < ActiveSupport::TestCase
  def serialize machine
    serializer = MachineSerializer.new(machine)
    ActiveModel::Serializer::Adapter::JsonApi.new(serializer).as_json
  end

  test "serialization" do
    machine = Machine.new name: "", status: "OK", disk_usage: 200
    machine.tag_list.add("store", "pear")
    machine.save!

    expected = {
      data: {
        id: machine.id.to_s,
        type: 'machines',
        attributes: {
          name: machine.name,
          status: machine.status,
          "disk-usage": machine.disk_usage,
          "tag-list": ["store", "pear"]
        }
      }
    }

    assert_equal expected, serialize(machine)
  end
end
