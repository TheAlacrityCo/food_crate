class AddUserReferences < ActiveRecord::Migration[6.0]
  def change
    add_reference :farms, :user, foreign_key: true
    add_reference :food_banks, :user, foreign_key: true
    add_reference :logistics_companies, :user, foreign_key: true
  end
end
