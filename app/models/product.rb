# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :category

  MIN_PRODUCT_NAME_LENGTH = 5
  MAX_PRODUCT_NAME_LENGTH = 150

  validates :name,
            presence: true,
            length: {
              minimum: MIN_PRODUCT_NAME_LENGTH,
              maximum: MAX_PRODUCT_NAME_LENGTH
            }

  before_validation do |product|
    product.name.try(:strip!)
  end

end
