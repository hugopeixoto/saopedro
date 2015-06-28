class BaseSerializer < ActiveModel::Serializer
  def attributes *options
    attrs = super

    Hash[attrs.map do |key, value|
      [key.to_s.dasherize.to_sym, value]
    end]
  end
end
