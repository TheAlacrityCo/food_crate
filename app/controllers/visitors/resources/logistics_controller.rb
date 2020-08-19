class Visitors::Resources::LogisticsController < ApplicationController
  def index
    @logistics = LogisticsCompany.all
  end

  def show
    # show
  end
end
