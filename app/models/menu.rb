# == Schema Information
#
# Table name: menus
#
#  id         :integer          not null, primary key
#  date       :date             not null
#  product_id :integer
#  price      :decimal(15, 2)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Menu < ActiveRecord::Base
  belongs_to :product
  has_one :category, through: :product
  has_many :orders, dependent: :destroy

  validates :date, presence: true

  validates :price,
            presence: true, 
            numericality: true

  validates :product, presence: true

end