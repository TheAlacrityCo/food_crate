class SuppliersController < ApplicationController
  before_action :authenticate_user!

  def new
    @supplier = Supplier.new
  end

  def create
    supplier = Supplier.new(supplier_params)
    if supplier.save
      flash[:success] = 'Supplier created successfully.'
      redirect_to suppliers_list_path
    else
      flash[:warning] = supplier.errors.full_messages.to_sentence + '.'
      redirect_to new_supplier_path
    end
  end

  private

  def supplier_params
    params.require(:supplier).permit(
      :name,
      :state,
      :country,
      :address,
      :phone,
      :supplier_type,
      :user_id
    )
  end
end
