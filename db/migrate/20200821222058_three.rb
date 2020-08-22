class Three < ActiveRecord::Migration[6.0]
  def change
    create_table :distributors do |t|
      t.string 'name'
      t.string 'state'
      t.string 'country'
      t.string 'address'
      t.string 'phone'
      t.integer 'need_level', dafault: 0
      t.integer 'distributor_type', dafault: 0
      t.integer 'capacity'
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
