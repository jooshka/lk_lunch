# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  has_many :products, dependent: :destroy

  MIN_CATEGORY_TITLE_LENGTH = 5
  MAX_CATEGORY_TITLE_LENGTH = 50

  validates :title,
            presence: true,
            length: {
              minimum: MIN_CATEGORY_TITLE_LENGTH,
              maximum: MAX_CATEGORY_TITLE_LENGTH
            }

  before_validation do |category|
    category.title.try(:strip!)
  end

end
