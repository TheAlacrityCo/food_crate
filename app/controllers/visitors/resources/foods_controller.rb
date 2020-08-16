class Visitors::Resources::FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end
end
