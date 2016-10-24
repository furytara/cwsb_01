class Order < ApplicationRecord
  belongs_to :coupon
  has_many :bookings
  belongs_to :venue
  belongs_to :user

  enum status: {requested:0 ,confirmed: 1, rejected: 2}

  accepts_nested_attributes_for :bookings
end
