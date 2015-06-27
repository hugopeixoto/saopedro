class RunscriptsController < ApplicationController
  def index
    render json: Runscript.all, each_serializer: RunscriptSerializer
  end
end
