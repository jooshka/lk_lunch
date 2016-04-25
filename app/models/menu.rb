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

  validates :date, presence: true

  validates :price,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }

  validates :product, presence: true

  validates_uniqueness_of :product_id, scope: :date

  before_validation do |menu|
    menu.price = menu.price.try(:round, 2)
  end

  def self.by_date_category(menu_date, category)
    Menu.joins(:product).where(:date => menu_date, 'products.category' => category)
  end

end
