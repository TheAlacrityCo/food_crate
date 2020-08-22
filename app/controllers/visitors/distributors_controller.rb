class Visitors::DistributorsController < ApplicationController
  def index
    @distributors = Distributor.all
  end

  def show
    @distributor = Distributor.find(params[:distributor_id])
  end
end
