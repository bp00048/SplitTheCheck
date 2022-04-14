class AddTypeToVotes < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :type, :string
  end
end
