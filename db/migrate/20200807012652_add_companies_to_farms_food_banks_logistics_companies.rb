class AddCompaniesToFarmsFoodBanksLogisticsCompanies < ActiveRecord::Migration[6.0]
  def change
    add_reference :farms, :companies, polymorphic: true
    add_reference :food_banks, :companies, polymorphic: true
    add_reference :logistics_companies, :companies, polymorphic: true
  end
end
