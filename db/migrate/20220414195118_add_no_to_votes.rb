class AddNoToVotes < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :no, :integer
  end
end
