class Restaurant < ApplicationRecord
  has_many :votes
  has_many :comments
  has_many :favorites
  after_initialize :set_defaults, unless: :persisted?
  validates :name, presence: true
  validates :website, allow_blank: true, format: {
    with:     %r{\.(com|net|couk|edu)\z}i,
    message: 'Must be a valid website.'
  }
  validates :location, presence: true,
  format: {
    with: /\A[a-zA-Z\s]+,\s[a-zA-Z]{2}\z/,
    message: "Location must be City, ST"
  }

  validates :yes_split, :no_split, numericality: {
    greater_than_or_equal_to: 0
  }

  def set_defaults
    self.yes_split ||= 0
    self.no_split ||= 0
  end

  def yes
    self.yes_split += 1
    self.save
  end

  def no
    self.no_split += 1
    self.save
  end
end
