# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category, required: true
  has_many :menus, dependent: :destroy
  has_many :order_items, through: :menus

  MIN_PRODUCT_NAME_LENGTH = 5
  MAX_PRODUCT_NAME_LENGTH = 150

  validates :name,
            presence: true,
            uniqueness: true,
            length: {
              minimum: MIN_PRODUCT_NAME_LENGTH,
              maximum: MAX_PRODUCT_NAME_LENGTH
            }

  before_save do
    if category_id_changed? && order_items.any?
      errors.add(:product, "category could not updated")
      false
    end
  end

  default_scope { order('name') }

  before_validation do |product|
    product.name.try(:strip!)
  end

end
