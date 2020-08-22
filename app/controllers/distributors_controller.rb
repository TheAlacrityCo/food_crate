class DistributorsController < ApplicationController
  before_action :authenticate_user!

  def new
    @distributor = Distributor.new
  end

  def create
    distributor_params[:distributor_type] = distributor_params[:distributor_type].to_i
    distributor = Distributor.new(distributor_params)
    if distributor.save
      flash[:success] = 'Distributor created successfully.'
      redirect_to distributors_list_path
    else
      flash[:warning] = distributor.errors.full_messages.to_sentence + '.'
      redirect_to new_distributor_path
    end
  end

  private

  def distributor_params
    params.require(:distributor).permit(
      :name,
      :state,
      :country,
      :address,
      :phone,
      :need_level,
      :distributor_type,
      :capacity,
      :user_id
    )
  end
end
