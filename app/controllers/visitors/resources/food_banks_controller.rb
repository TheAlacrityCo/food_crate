class Visitors::Resources::FoodBanksController < ApplicationController
  def index
    @food_banks = FoodBank.all
  end
end
