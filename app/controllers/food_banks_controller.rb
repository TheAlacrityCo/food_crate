class FoodBanksController < ApplicationController
  before_action :authenticate_user!

  def new
    @food_bank = FoodBank.new
  end
end
