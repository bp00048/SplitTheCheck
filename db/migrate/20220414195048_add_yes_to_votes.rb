class AddYesToVotes < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :yes, :integer
  end
end
