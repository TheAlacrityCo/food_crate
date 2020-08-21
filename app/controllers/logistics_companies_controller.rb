class LogisticsCompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
    @company = LogisticsCompany.new
  end

  def create
    company = LogisticsCompany.new(logistics_params)
    if company.save
      flash[:success] = 'Logistics Company created successfully.'
      redirect_to logistics_list_path
    else
      flash[:warning] = company.errors.full_messages.to_sentence + '.'
      redirect_to new_logistics_company_path
    end
  end

  private

  def logistics_params
    params.require(:logistics_company).permit(
      :name,
      :state,
      :country,
      :address,
      :phone,
      :max_load,
      :user_id
    )
  end
end
