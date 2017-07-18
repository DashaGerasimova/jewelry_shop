class Product < ApplicationRecord
  validates :size, inclusion: { in: 17..30, message: "should be between 17 and 30" }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  resourcify
end
