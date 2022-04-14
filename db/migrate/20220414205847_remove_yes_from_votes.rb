class RemoveYesFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :yes, :integer
  end
end
