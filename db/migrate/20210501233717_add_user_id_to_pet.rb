class AddUserIdToPet < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :user_id, :integer, null: false
    add_column :pets, :type, :string, null: false

  end
end
