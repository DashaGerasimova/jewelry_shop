class Product < ApplicationRecord
  validates :size, inclusion: { in: 17..30, message: "should be between 17 and 30" }
end
