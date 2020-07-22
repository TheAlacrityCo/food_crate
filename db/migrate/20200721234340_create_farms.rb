class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string 'name'
      t.string 'state'
      t.string 'country'
      t.string 'address'
      t.string 'phone'
      t.integer 'need_level', dafault: 0

      t.timestamps
    end
  end
end
