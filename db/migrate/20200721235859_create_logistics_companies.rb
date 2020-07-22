class CreateLogisticsCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :logistics_companies do |t|
      t.string 'name'
      t.string 'state'
      t.string 'country'
      t.string 'address'
      t.string 'phone'
      t.integer 'max_load'

      t.timestamps
    end
  end
end
