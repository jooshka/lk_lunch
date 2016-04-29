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
  belongs_to :product, required: true
  has_one :category, through: :product
  has_many :order_items, dependent: :destroy

  validates :date, presence: true

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  validates_uniqueness_of :product_id, scope: :date

  before_save do
    if order_items.any?
      errors.add(:menu, "could not be updated.")
      false
    end
  end

  before_validation do |menu|
    menu.price = menu.price.try(:round, 2)
  end

  scope :day, -> (date) { where(:date => date) }

  scope :day_category, -> (date, category) {
    joins(:product)
   .where(:date => date, 'products.category' => category)
  }

end
