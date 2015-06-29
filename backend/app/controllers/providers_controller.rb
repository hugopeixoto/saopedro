class ProvidersController < ApplicationController
  def index
    render json: Provider.order(:name), each_serializer: ProviderSerializer,
      include: 'machine_templates'
  end
end
