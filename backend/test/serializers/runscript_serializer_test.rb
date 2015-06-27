class RunscriptSerializerTest < ActiveSupport::TestCase
  def serialize runscript
    serializer = RunscriptSerializer.new(runscript)
    ActiveModel::Serializer::Adapter::JsonApi.new(serializer).as_json
  end

  test "serialization" do
    runscript = Runscript.new name: "Dockerify", script: "#! /usr/bin/env bash\napt-get install docker"
    runscript.tag_list.add("store", "banana")
    runscript.save!

    expected = {
      data: {
        id: runscript.id.to_s,
        type: 'runscripts',
        attributes: {
          name: runscript.name,
          script: runscript.script,
          tag_list: ["store", "banana"]
        }
      }
    }

    assert_equal expected, serialize(runscript)
  end
end
