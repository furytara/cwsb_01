class Address < ApplicationRecord
  belongs_to :county
  belongs_to :venue
  has_many :spaces, through: :venue
  validates :details, presence: true

  geocoded_by :details
  after_validation :geocode
end
