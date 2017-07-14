class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
  has_one :shopping_cart, dependent: :destroy
  has_many :shopping_cart_items, through: :shopping_cart
  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy

  def admin?
    self.has_role? :admin
  end
  def editor?
    self.has_role? :editor
  end
end
