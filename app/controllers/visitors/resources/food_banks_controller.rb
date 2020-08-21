class Visitors::Resources::FoodBanksController < ApplicationController
  def index
    @food_banks = FoodBank.all
  end

  def show
    @food_bank = FoodBank.find(params[:food_bank_id])
  end
end
