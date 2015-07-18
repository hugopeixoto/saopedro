class MachinesController < ApplicationController
  def index
    render json: Machine.order(:name), each_serializer: MachineSerializer
  end

  def create
    raise unless request.format == 'application/vnd.api+json'

    payload = JSON.parse request.body.read

    raise unless payload.fetch('data').fetch('type') == 'machines'

    attrs = Hash[payload.fetch('data').fetch('attributes').select do |k, v|
      ['name', 'machine-template-id', 'tag-list'].include? k
    end.map do |k, v|
      [k.underscore, v]
    end]

    machine = Machine.new attrs
    machine.machine_template = machine_template(payload)

    if machine.save
      render json: machine, status: :created
    else
      render json: machine, status: :bad_request
    end
  end

  private

  #"relationships"=>{"machine-template"=>
  #  {"data"=>{"type"=>"machine-templates", "id"=>"1"}}}
  def machine_template payload
    MachineTemplate.find(payload.fetch('data').
                         fetch('relationships').
                         fetch('machine-template').
                         fetch('data').fetch('id'))
  end
end
