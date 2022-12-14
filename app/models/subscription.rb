class Subscription < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  enum status: { "active": 0, "cancelled": 1 }
  validates_presence_of :frequency
  validates_numericality_of :customer_id
  validates_numericality_of :tea_id
  belongs_to :customer
  belongs_to :tea
end