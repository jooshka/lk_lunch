# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  show_order :integer          not null
#

class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy
  has_many :menus, through: :products, dependent: :destroy

  MIN_CATEGORY_TITLE_LENGTH = 5
  MAX_CATEGORY_TITLE_LENGTH = 50

  validates :title,
            presence: true,
            uniqueness: true,
            length: {
              minimum: MIN_CATEGORY_TITLE_LENGTH,
              maximum: MAX_CATEGORY_TITLE_LENGTH
            }

  validates :show_order,
            presence: true,
            uniqueness: true,
            numericality: { only_integer: true }

  default_scope { order('show_order') }

  before_validation do |category|
    category.title.try(:strip!)
  end

end
