class One < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string 'name'
      t.string 'state'
      t.string 'country'
      t.string 'address'
      t.string 'phone'
      t.integer 'supplier_type', dafault: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
