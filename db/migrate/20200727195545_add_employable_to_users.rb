class AddEmployableToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :employable, polymorphic: true
  end
end
