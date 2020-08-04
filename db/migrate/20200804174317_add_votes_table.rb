class AddVotesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :post_id
      t.integer :user_id
      t.string :vote_type
      t.timestamps
    end
  end
end
