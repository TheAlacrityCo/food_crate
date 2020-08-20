class FarmsController < ApplicationController
  before_action :authenticate_user!

  def new
    @farm = Farm.new
  end

  def create
    farm = Farm.new(farm_params)
    if farm.save
      flash[:success] = 'Farm created successfully.'
      redirect_to farms_list_path
    else
      flash[:warning] = farm.errors.full_messages.to_sentence + '.'
      redirect_to new_farm_path
    end
  end

  private

  def farm_params
    params.require(:farm).permit(
      :name,
      :state,
      :country,
      :address,
      :phone,
      :need_level,
      :user_id
    )
  end
end
