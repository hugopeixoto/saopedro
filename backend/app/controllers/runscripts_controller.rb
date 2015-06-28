class RunscriptsController < ApplicationController
  def index
    render json: Runscript.all, each_serializer: RunscriptSerializer
  end

  def create
    raise unless request.format == 'application/vnd.api+json'

    payload = JSON.parse request.body.read

    raise unless payload.fetch('data').fetch('type') == 'runscripts'

    attrs = payload.fetch('data').fetch('attributes').select do |k, v|
      ['name', 'script', 'tag-list'].include? k
    end

    runscript = Runscript.new attrs
    if runscript.save
      render json: runscript, status: :created
    else
      render json: runscript, status: :bad_request
    end
  end
end
