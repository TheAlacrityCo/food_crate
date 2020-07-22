class CreateFoodBanks < ActiveRecord::Migration[6.0]
  def change
    create_table :food_banks do |t|
      t.string 'name'
      t.string 'state'
      t.string 'country'
      t.string 'address'
      t.string 'phone'
      t.integer 'need_level', dafault: 0
      t.integer 'capacity'

      t.timestamps
    end
  end
end
