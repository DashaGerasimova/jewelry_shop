class Jewel < ApplicationRecord
  validates :name, :jewel_type, :size, :image, :price, presence: true
  validates :size, inclusion: { in: 17..30, message: "should be between 17 and 30" }
end
