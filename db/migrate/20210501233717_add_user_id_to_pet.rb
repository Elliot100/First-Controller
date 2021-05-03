class AddUserIdToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :user_id, :integer, null: false
    add_column :pets, :ttype, :string, null: false

  end
end
