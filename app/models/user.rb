class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  after_create :assign_default_role

  def assign_default_role
    self.add_role(:customer) if self.roles.blank?
  end

  def admin?
    has_role? :admin
  end
  def manager?
    has_role? :manager
  end
end
