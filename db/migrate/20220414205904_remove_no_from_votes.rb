class RemoveNoFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_column :votes, :no, :integer
  end
end
