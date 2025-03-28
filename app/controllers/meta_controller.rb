class MetaController < ApplicationController
  def index
    render json: { message: "Meta info" }
  end
end
