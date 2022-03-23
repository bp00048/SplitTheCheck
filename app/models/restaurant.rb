class Restaurant < ApplicationRecord
  validates :name, :location, presence: true
  validates :website, allow_blank: true, format: {
    with:     %r{\.(com|net|couk|edu)\z}i,
    message: 'Must be a valid website.'
  }

end
