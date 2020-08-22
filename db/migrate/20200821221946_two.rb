class Two < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string 'name'
      t.integer 'amount'
      t.string 'unit_type'
      t.datetime 'expiration'
      t.references :supplier, null: false, foreign_key: true
    end
  end
end
