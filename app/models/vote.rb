class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def yes
    self.vote_type = "Yes"
    self.save
  end

  def no
    self.vote_type = "No"
    self.save
  end
end
