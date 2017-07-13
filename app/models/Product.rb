class Product < ApplicationRecord
  validates :size, inclusion: { in: 17..30, message: "should be between 17 and 30" }

  belongs_to :user
  has_many :comments, dependent: :destroy

  resourcify

  def user_email
    User.find_by(id: self.user_id).email
  end
end
