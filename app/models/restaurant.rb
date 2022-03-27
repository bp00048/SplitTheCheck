class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :website, allow_blank: true, format: {
    with:     %r{\.(com|net|couk|edu)\z}i,
    message: 'Must be a valid website.'
  }
  after_initialize :set_defaults, unless: :persisted?

  validates :yes_split, :no_split, numericality: {
    greater_than_or_equal_to: 0
  }

  def set_defaults
    self.yes_split ||= 0
    self.no_split ||= 0
  end

end
