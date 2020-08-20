class FoodBanksController < ApplicationController
  before_action :authenticate_user!

  def new
    @food_bank = FoodBank.new
  end

  def create
    food_bank = FoodBank.new(food_bank_params)
    if food_bank.save
      flash[:success] = 'Food Bank created successfully.'
      redirect_to food_banks_list_path
    else
      flash[:warning] = food_bank.errors.full_messages.to_sentence + '.'
      redirect_to new_food_bank_path
    end
  end

  private

  def food_bank_params
    params.require(:food_bank).permit(
      :name,
      :state,
      :country,
      :address,
      :phone,
      :need_level,
      :capacity,
      :user_id
    )
  end
end
