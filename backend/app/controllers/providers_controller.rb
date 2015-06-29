class ProvidersController < ApplicationController
  def index
    render json: Provider.order(:name), each_serializer: ProviderSerializer
  end
end
