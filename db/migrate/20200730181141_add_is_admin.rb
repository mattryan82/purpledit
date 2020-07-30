class AddIsAdmin < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_admin, :boolean
    add_column :comments, :user_id, :integer
  end
end
