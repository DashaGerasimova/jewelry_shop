class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  resourcify

  def self.search(search_term)
    if search_term
      where('name LIKE ?', "%#{search_term.downcase}%")
    else
      all
    end
  end
end
