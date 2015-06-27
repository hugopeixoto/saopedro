class MachinesController < ApplicationController
  def index
    render json: Machine.order(:name), each_serializer: MachineSerializer
  end
end
