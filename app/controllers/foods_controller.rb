class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food = Food.new
  end

  def create
    farm = Farm.find(params[:farm_id])
    food = farm.foods.new(food_params)
    if food.save
      flash[:success] = 'Food created successfully.'
      redirect_to farm_show_path(food.farm_id)
    else
      flash[:warning] = food.errors.full_messages.to_sentence + '.'
      redirect_to new_farm_food_path
    end
  end

  private

  def food_params
    params.require(:food).permit(
      :name,
      :amount,
      :unit_type,
      :expiration,
      :farm_id
    )
  end
end
