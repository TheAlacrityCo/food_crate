class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food = Food.new
  end

  def create
    supplier = Supplier.find(params[:supplier_id])
    food = supplier.foods.new(food_params)
    if food.save
      flash[:success] = 'Food created successfully.'
      redirect_to supplier_show_path(food.supplier_id)
    else
      flash[:warning] = food.errors.full_messages.to_sentence + '.'
      redirect_to new_supplier_food_path
    end
  end

  private

  def food_params
    params.require(:food).permit(
      :name,
      :amount,
      :unit_type,
      :expiration,
      :supplier_id
    )
  end
end
