class HomeController < ApplicationController
  def index
    render json: { status: 'It works!' }
  end
end
