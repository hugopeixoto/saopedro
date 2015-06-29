class ProviderSerializerTest < ActiveSupport::TestCase
  def serialize provider
    serializer = ProviderSerializer.new(provider)
    ActiveModel::Serializer::Adapter::JsonApi.new(serializer).as_json
  end

  test "serialization" do
    provider = Provider.create name: "", api_key: "OK"

    expected = {
      data: {
        id: provider.id.to_s,
        type: 'providers',
        attributes: {
          name: provider.name,
          "api-key": provider.api_key,
        }
      }
    }

    assert_equal expected, serialize(provider)
  end
end
