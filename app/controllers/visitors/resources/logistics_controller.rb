class Visitors::Resources::LogisticsController < ApplicationController
  def index
    @logistics = LogisticsCompany.all
  end

  def show
    @company = LogisticsCompany.find(params[:logistics_company_id])
  end
end
