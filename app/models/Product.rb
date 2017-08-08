class Product < ApplicationRecord
    
  belongs_to :user
  has_many :comments, dependent: :destroy

  resourcify

  def rating
    sum = 0.0
    self.comments.to_a.each {|comment| sum += comment.rating}
    sum /= self.comments.count
  end
end
